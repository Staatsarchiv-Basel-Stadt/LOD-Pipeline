#!/bin/sh

# Make the script crash in case of issue
set -eu

# You should configure the following environment variables before calling this script:
# - SPARQL_ENDPOINT
# - SPARQL_USER
# - SPARQL_PASSWORD

# Configuration
GRAPH_NAME="https://ld.staatsarchiv.bs.ch/graph/ais-metadata"

# First upload will be done using PUT, then all other using POST (reset the graph)
METHOD="PUT"

# Iterate over all .nt files that are in the output directory
date
echo "Uploading files into the triplestore…"
for file in output/*.nt; do
  echo "[$(date)] Uploading '$file' (${METHOD})…"

  # Do the upload
  curl -X "${METHOD}" \
    --fail-with-body \
    -H "Content-Type: application/n-triples" \
    -T "${file}" \
    -u "${SPARQL_USER}:${SPARQL_PASSWORD}" \
    "${SPARQL_ENDPOINT}?graph=${GRAPH_NAME}"

  # All other uploads will use POST
  if [ "${METHOD}" = "PUT" ]; then
    METHOD="POST"
  fi
done

exit 0
