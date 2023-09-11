#!/bin/sh

# Make the script crash in case of issue
set -eu

# Configuration
INPUT_DEST_NAME="input/input.json"
FILE_PREFIX="StABS_full"

# Get the source name of the last full input file
INPUT_SOURCE_NAME=$(mc ls "bucket/${S3_BUCKET}/${S3_PATH}/${FILE_PREFIX}" | awk '{ print $NF }' | sort | tail -n1)
if [ -z "${INPUT_SOURCE_NAME}" ]; then
  echo "ERROR: No input file was found that has this prefix '${FILE_PREFIX}'" >&2
  exit 1
fi
mc cp "bucket/${S3_BUCKET}/${S3_PATH}/${INPUT_SOURCE_NAME}" "${INPUT_DEST_NAME}"

exit 0
