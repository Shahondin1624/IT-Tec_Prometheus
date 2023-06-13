#!/bin/bash
#Arguments: 
#1: Github Token
#2 Timestamp in the following format: YYYY-MM-DDTHH:MM:SSZ - 2023-05-08T00:00:00Z
#3 Username
#4 Repository-name
result=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${1}"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -G --data-urlencode "since=${2}" \
  https://api.github.com/repos/${3}/${4}/commits)
echo ${result} | jq
