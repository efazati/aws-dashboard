#!/bin/sh
set -e
DIR="$(pwd)"
ENV_PATH=$1

. "${ENV_PATH}"
.  "${DIR}/ec2.sh"
.  "${DIR}/rds.sh"