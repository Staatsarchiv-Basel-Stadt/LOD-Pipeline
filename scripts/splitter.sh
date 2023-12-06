#!/bin/sh

# Make the script crash in case of issue
set -eu

# Configuration
INPUT_DIR="input"
SLICE_SIZE=10000
DST_DIR="output"

# Update the file to have one entry per line
generate_one_entry_per_line () {
  local file_name="$1"

  jq -cM '.[]' "${file_name}" > "${file_name}.tmp"
  rm -f "${file_name}"
  mv "${file_name}.tmp" "${file_name}"
}

# Split the file into multiple files
split_file () {
  local file_name="$1"

  # Extract the filename and extension
  local name=$(basename "$file_name")
  local name="${name%.*}"

  split -d -a 4 -l "$SLICE_SIZE" "$file_name" "${DST_DIR}/SPLITTED-${name}."
}

# Remove the destination directory and create it again
rm -rf "${DST_DIR}"
mkdir -p "${DST_DIR}"

# Iterate over each file to split them
echo "$(date) - Splitting the files…"
for file in $INPUT_DIR/*.json; do
  echo "- $file"
  generate_one_entry_per_line "$file"
  split_file "$file"
done

# Iterate over each splitted file to generate a new file with fixed JSON
echo "$(date) - Generating the new files…"
for file in $DST_DIR/SPLITTED-*; do
  NEW_NAME=$(echo "${file}" | sed 's/SPLITTED-/split-/')
  rm -f "${NEW_NAME}"
  echo "- $file -> ${NEW_NAME}.json"
  jq -csM '.' "${file}" > "${NEW_NAME}.json"
  rm -f "${file}"
done

echo "$(date) - Done!"

exit 0
