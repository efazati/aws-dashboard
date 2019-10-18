#!/bin/sh
set -e
DIR="$(pwd)"
ENV_PATH=$1

. "${ENV_PATH}"
for environment in "${environments[@]}";
do
    printf "%60s \n" " " | tr ' ' '=' 
    echo "${environment}:"

	.  "${DIR}/ec2.sh"
	.  "${DIR}/rds.sh"
	.  "${DIR}/ecr.sh"
	.  "${DIR}/s3.sh"
	.  "${DIR}/lambda.sh"

done
