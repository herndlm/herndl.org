#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

readonly BODY=$(markdown "${DIR}/index.md")
readonly OUTPUT_FILE="${DIR}/index.html"

cat "${DIR}/template_before.html" > "${OUTPUT_FILE}"
echo "${BODY}" >> "${OUTPUT_FILE}"
cat "${DIR}/template_after.html" >> "${OUTPUT_FILE}"

tidy -modify "${OUTPUT_FILE}"

