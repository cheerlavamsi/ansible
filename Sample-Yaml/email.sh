#!/bin/bash

read -p 'Enter batch no: ' batch_no
cat courses.yml | yq . | jq '.[].batchno' | grep -w $batch_no &>/dev/null
if [ $? -ne 0 ]; then
    echo "Given batch no doesnot exist"
    exit 1
fi
