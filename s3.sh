printf "%60s \n" " " | tr ' ' '-'
echo "S3:"
buckets=$(aws s3api list-buckets --profile ${environment}  2>&1 | jq '.Buckets[].Name' | wc -l | sed "s/^/     /")
if  [ ! -z "$buckets" ]
then
    echo "${buckets}"
fi
