#!/bin/bash 

DATE=$(date --utc +"%FT%TZ")
WEB_PROC_COUNT=$(ps -ef | grep nginx | grep -v grep | wc -l)
JAVA_PROC_COUNT=$(ps -ef | grep java | grep -v grep | wc -l)

AWS="aws --region {{AWS_REGION}}"

$AWS cloudwatch put-metric-data --metric-name Web-Process --namespace 
System-Process --timestamp --value $WEB_PROC_COUNT --unit Milliseconds
$AWS cloudwatch put-metric-data --metric-name Java-Process --namespace 
System-Process --timestamp  --value $JAVA_PROC_COUNT --unit Milliseconds
