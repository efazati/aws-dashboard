printf "%60s \n" " " | tr ' ' '='
echo "RDS:"
for environment in "${environments[@]}"
do
    printf "%60s \n" " " | tr ' ' '-' 
    echo "${environment}:"
    instances_by_type=$(aws rds describe-db-instances  --profile ${environment}  2>&1 | jq '.DBInstances | .[] | .DBInstanceClass' | sort | uniq -c | sort -r)
    instances_by_engine=$(aws rds describe-db-instances  --profile ${environment}   2>&1 | jq '.DBInstances | .[] | .Engine' | sort | uniq -c | sort -r)
    if  [ ! -z "$instances_by_type" ]
    then
        printf "%60s \n" " " | tr ' ' '-'
        echo "   ${region}"
        echo "   * By Instance Type"
        echo "${instances_by_type}"
        echo "   * By Engine Type"
        echo "${instances_by_engine}"

    fi
done

