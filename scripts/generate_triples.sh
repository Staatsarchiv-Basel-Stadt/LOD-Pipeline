#!/bin/sh

# Make the script crash in case of issue
set -eu

CARML_SERVICE="https://carml.zazukoians.org/"
# CARML_SERVICE="http://localhost:8080/"
export CARML_SERVICE

mkdir -p output

date
echo "Some cleanup…"
for file in output/split-*.json; do
  echo ""
  date
  echo "- Running the pipeline for ${file}…"


  inputFile="${file}"
  outputFile=$(echo "${file}" | sed 's/\.json$/.nt/')
  export inputFile
  export outputFile
  npx barnard59 run -v --pipeline=http://example.org/pipeline/toFile pipelines/main.ttl --variable=CARML_SERVICE --variable=inputFile --variable=outputFile
done

echo ""
date
echo "Done!"

exit 0
