#!/bin/sh

# Make the script crash in case of issue
set -eu

# Configuration
INPUT_FILE_NAME="input/input.json"
SLICE_SIZE=10000
TMP_FILE="output/tmp_input_split.tmp"

# Display the current configuration
date
echo "Splitting the '${INPUT_FILE_NAME}' file into files with ${SLICE_SIZE} entries maximum…"

#  Create the `output` directory and remove old splitted files
mkdir -p output
rm -f "${TMP_FILE}"
rm -f output/raw-split-*.json
rm -f output/split-*.json

# Generate a temporary file to have raw JSON lines (one line per entry)
echo "Generate a temporary file, with one entry per line…"
jq -cM '.[]' "${INPUT_FILE_NAME}" > "${TMP_FILE}"
echo "Done!"

echo ""

# Iterate over each line to generate a file every `$SLICE_SIZE` lines
# `split` cannot be used, as it is platform-dependant
date
echo "Generate the files for the splits…"
SPLIT_ID=0
LINE_NB=0
cat "${TMP_FILE}" | while read -r line; do
  LINE_NB=$((LINE_NB +  1))
  OUTPUT_NAME="output/raw-split-${SPLIT_ID}.json"

  # Handle the creation of a new split file
  if [ "${LINE_NB}" -eq 1 ]; then
    SPLIT_ID=$((SPLIT_ID +  1))
    OUTPUT_NAME="output/raw-split-${SPLIT_ID}.json"
    echo "\n - Create the '${OUTPUT_NAME}' file for the split…"
    rm -f "${OUTPUT_NAME}"
  fi

  # Show some progress
  if [ "$((LINE_NB % 100))" -eq 0 ]; then
    printf "."
  fi

  # Print the line in the file
  printf "%s\n" "${line}" >> "${OUTPUT_NAME}"

  # Reset the line count if we hit the slice size
  if [ "${LINE_NB}" -eq "${SLICE_SIZE}" ]; then
    LINE_NB=0
  fi
done
echo ""

# Remove the temporary file that we needed
rm -f "${TMP_FILE}"
echo ""

# Do some cleanup for the files
date
echo "Some cleanup…"
for file in output/raw-split-*.json; do
  NEW_NAME=$(echo "${file}" | sed 's/output\/raw-/output\//')
  rm -f "${NEW_NAME}"
  echo "- $file -> ${NEW_NAME}"
  jq -csM '.' "${file}" > "${NEW_NAME}"
  rm -f "${file}"
done

exit 0
