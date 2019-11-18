#!/bin/bash

read -p 'Enter batch no: ' batch_no
VALUE=$(cat courses.yml | yq . | jq ".b${batch_no}")
if [ "$VALUE" = "null" ]; then
    echo "Given batch no doesnot exist"
    exit 1
fi
