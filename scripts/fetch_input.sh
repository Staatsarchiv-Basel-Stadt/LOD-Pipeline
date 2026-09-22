#!/bin/sh

# Make the script crash in case of issue
set -eu

# Load the file prefixes
. ./scripts/file_prefix.sh

# Configuration
DST_DIR="input"

# Get the last file matching a prefix
get_file_by_prefix () {
  local prefix="$1"
  echo "[$(date)] Get the last file matching the prefix '${prefix}'…"

  local file_name=$(s5cmd ls "s3://${S3_BUCKET}/${S3_PATH}/${prefix}*" | awk '{ n=split($NF, parts, "/"); print parts[n] }' | sort | tail -n1)
  if [ -z "${file_name}" ]; then
    echo "ERROR: No input file was found that has this prefix '${prefix}'" >&2
    exit 1
  fi

  echo "Copy the file '${file_name}' to '${DST_DIR}/${prefix}.json'…"
  s5cmd cp "s3://${S3_BUCKET}/${S3_PATH}/${file_name}" "${DST_DIR}/${prefix}.json"
  echo "Done!"
  echo ""
}

# Iterator over each file prefix (defined in `file_prefix.sh`)
OLD_IFS=$IFS
IFS=","
for prefix in $FILE_PREFIX; do
  get_file_by_prefix "${prefix}"
done
IFS=$OLD_IFS

exit 0
