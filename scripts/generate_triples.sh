#!/bin/sh

# Make the script crash in case of issue
set -eu

if [ -z "${CARML_SERVICE}" ]; then
  CARML_SERVICE="https://carml.zazukoians.org/"
  # CARML_SERVICE="http://localhost:8080/"
fi
export CARML_SERVICE

# Make sure the output directory exists
mkdir -p output

echo "$(date) - Run the pipeline…"

# Iterate over each splitted file
for file in output/split-*.json; do
  echo "$(date) - Running the pipeline for ${file}…"

  inputFile="${file}"
  outputFile=$(echo "${file}" | sed 's/\.json$/.nt/')
  export inputFile
  export outputFile
  npx barnard59 run -v --pipeline=http://example.org/pipeline/toFile pipelines/main.ttl --variable=CARML_SERVICE --variable=inputFile --variable=outputFile
done

echo "$(date) - Done!"

exit 0
