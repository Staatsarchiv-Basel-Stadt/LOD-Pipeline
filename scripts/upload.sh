#!/bin/sh

# Make the script crash in case of issue
set -eu

# You should configure the following environment variables before calling this script:
# - SPARQL_ENDPOINT
# - SPARQL_USER
# - SPARQL_PASSWORD

# Configuration
GRAPH_NAME="https://ld.bs.ch/graph/ais-metadata"

date

# Drop the graph first, so that the uploads below start from an empty graph.
# A 404 is fine as well: it just means the graph does not exist yet.
echo "[$(date)] Dropping the graph <${GRAPH_NAME}>…"
response_body=$(mktemp)
http_code=$(curl -X DELETE \
  --silent \
  --show-error \
  --retry 5 \
  --retry-delay 10 \
  --retry-all-errors \
  --output "${response_body}" \
  --write-out "%{http_code}" \
  -H "Authorization: Bearer ${SPARQL_TOKEN}" \
  "${SPARQL_ENDPOINT}?graph=${GRAPH_NAME}") || true
case "${http_code}" in
  2??|404) ;;
  *)
    echo "Dropping the graph failed (HTTP ${http_code}), response body:" >&2
    cat "${response_body}" >&2
    rm -f "${response_body}"
    exit 1
    ;;
esac
rm -f "${response_body}"

# Iterate over all .nt files that are in the output directory
echo "Uploading files into the triplestore…"
for file in output/*.nt; do
  echo "[$(date)] Uploading '$file'…"

  # Do the upload
  # Retry a few times in case of transient errors (timeout, 502, …); this is
  # safe, as re-uploading the same triples is idempotent.
  # Stay silent on success; only show the response body if the upload failed.
  response_body=$(mktemp)
  curl -X POST \
    --fail-with-body \
    --silent \
    --show-error \
    --retry 5 \
    --retry-delay 10 \
    --retry-all-errors \
    --output "${response_body}" \
    -H "Content-Type: application/n-triples" \
    -T "${file}" \
    -H "Authorization: Bearer ${SPARQL_TOKEN}" \
    "${SPARQL_ENDPOINT}?graph=${GRAPH_NAME}" || {
    status=$?
    echo "Upload of '${file}' failed, response body:" >&2
    cat "${response_body}" >&2
    rm -f "${response_body}"
    exit "${status}"
  }
  rm -f "${response_body}"
done

exit 0
