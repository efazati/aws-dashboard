printf "%60s \n" " " | tr ' ' '-'
echo "Lambda:"
functions=$(aws lambda list-functions --profile  ${environment}  2>&1 | jq '.Functions | .[] | .FunctionArn |  split(":") | .[3]' | sort | uniq -c | sort -r)
if  [ ! -z "$functions" ]
then
    echo "${functions}"

fi

