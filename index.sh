#!/usr/bin/env bash

FILENAME_SUFFIX="html"
OUTPUT_FILENAME_SUFFIX="slim.html"

if [ "$#" -eq 1 ]; then
  # a single argument

  if [ -e "$1" ]; then
    # the file is existing

    if [ "${1##*.}" == "$FILENAME_SUFFIX" ]; then
      # the file type is supporting

      # generate output filename
      OUTPUT_FILENAME="${1%.*}.$OUTPUT_FILENAME_SUFFIX"

      # replace
      sed -E -e 's/ADD_DATE="[0-9]*"//' -e 's/LAST_MODIFIED="[0-9]*"//' -e 's/ICON="[a-z|A-Z|0-9|+|-|=|:|/|;|,]*"//' -e 's/\s{1,}>/>/' "$1" > "$OUTPUT_FILENAME"
    else
      echo 'Error: the file type is not supporting'
    fi
  else
    echo 'Error: the file is not existing'
  fi
else
  echo 'Error: only supports a single argument'
fi
