#!/bin/bash

read -p 'Enter batch no: ' batch_no
VALUE=$(cat courses.yml | yq . | jq ".b${batch_no}")
if [ "$VALUE" = "null" ]; then
    echo "Given batch no doesnot exist"
    exit 1
fi

NAMES=(`cat courses.yml | yq . | jq ".b${batch_no}.students[].name"|xargs`)
EMAILS=(`cat courses.yml | yq . | jq .b${batch_no}.students[].email|xargs`)


VALUE_NO=$(echo ${#NAMES[*]})

while [ $VALUE_NO -gt 0 ]; do 
    VALUE_NO=$(($VALUE_NO-1))
    echo -e "Hello ${NAMES[$VALUE_NO]}, I am sending an emails to ${EMAILS[$VALUE_NO]}"
done    