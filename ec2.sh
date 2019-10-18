for environment in "${environments[@]}"
do
    echo "${environment}:"
    for region in $(aws ec2 describe-regions --profile "${environment}" --query 'Regions[].RegionName | sort(@)' --output text); \
    do 

        nodes=$(aws ec2 describe-instances \
            --region "${region}" \
            --filter Name=instance-state-name,Values=running  --profile "${environment}"  \
            --query 'Reservations[].Instances[].{InstanceType:InstanceType}' \
            | jq -r '.[].InstanceType' \
            | sort \
            | uniq -c \
            | sort -r)

        if  [ ! -z "$nodes" ]
        then
            network_intefaces=$(aws ec2 describe-network-interfaces --profile "${environment}" --region "${region}" -- 2>&1 | jq '.NetworkInterfaces | .[] | "\(.NetworkInterfaceId) -> \(.Description)"'  | wc -l)
            echo "   ${region}"
            echo "    * Network intefaces: ${network_intefaces}"
            echo "${nodes}"
        fi
    done
done
