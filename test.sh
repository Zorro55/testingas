#!/bin/bash

set -e

job_name="whatever"
JOB_URL="http://myserver:8080/job/${job_name}/"
FILTER_PATH="path/to/folder/to/monitor"

python_func="import json, sys
obj = json.loads(sys.stdin.read())
ch_list = obj['changeSet']['items']
_list = [ j['affectedPaths'] for j in ch_list ]
for outer in _list:
  for inner in outer:
    print inner
"

_affected_files=`curl --silent ${JOB_URL}${BUILD_NUMBER}'/api/json' | python -c "$python_func"`

if [ -z "`echo \"$_affected_files\" | grep \"${FILTER_PATH}\"`" ]; then
  echo "[INFO] no changes detected in ${FILTER_PATH}"
  exit 0
else
  echo "[INFO] changed files detected: "
  for a_file in `echo "$_affected_files" | grep "${FILTER_PATH}"`; do
    echo "    $a_file"
  done;
fi;