#!/bin/sh
set -e
DIR="$(pwd)"
ENV_PATH=$1

. "${ENV_PATH}"
for environment in "${environments[@]}";
do
    printf "%60s \n" " " | tr ' ' '=' 
    echo "${environment}:"

	.  "${DIR}/services/ec2.sh"
	.  "${DIR}/services/vpc.sh"
	.  "${DIR}/services/rds.sh"
	.  "${DIR}/services/ecr.sh"
	.  "${DIR}/services/s3.sh"
	.  "${DIR}/services/lambda.sh"

done
