#!/bin/sh

# Make the script crash in case of issue
set -eu

# You should configure the following environment variables before calling this script:
# - SPARQL_ENDPOINT
# - SPARQL_USER
# - SPARQL_PASSWORD

# Configuration
GRAPH_NAME="https://ld.bs.ch/graph/ais-metadata"

# First upload will be done using PUT, then all other using POST (reset the graph)
METHOD="PUT"

# Iterate over all .nt files that are in the output directory
date
echo "Uploading files into the triplestore…"
for file in output/*.nt; do
  echo "[$(date)] Uploading '$file' (${METHOD})…"

  # Do the upload
  # Retry a few times in case of transient errors (timeout, 502, …); this is
  # safe even for POST, as re-uploading the same triples is idempotent.
  # Stay silent on success; only show the response body if the upload failed.
  response_body=$(mktemp)
  curl -X "${METHOD}" \
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

  # All other uploads will use POST
  if [ "${METHOD}" = "PUT" ]; then
    METHOD="POST"
  fi
done

exit 0
