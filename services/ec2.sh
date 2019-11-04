printf "%60s \n" " " | tr ' ' '-'
echo "EC2:"
for region in $(aws ec2 describe-regions --profile "${environment}" --query 'Regions[].RegionName | sort(@)' --output text); \
do 
    raw_nodes=$(aws ec2 describe-instances \
        --region "${region}" \
        --filter Name=instance-state-name,Values=running  --profile "${environment}"  \
        --query 'Reservations[].Instances[].{InstanceType:InstanceType}' \
        | jq -r '.[].InstanceType')

    if  [ ! -z "$raw_nodes" ]
    then
        nodes=$(echo ${raw_nodes} \
            | tr " " "\n" \
            | sort \
            | uniq -c \
            | sort -r)
        nodes_count=$(echo ${raw_nodes} \
            | tr " " "\n" \
            | wc -l)
        network_intefaces=$(aws ec2 describe-network-interfaces --profile "${environment}" --region "${region}" 2>&1 | jq '.NetworkInterfaces | .[] | "\(.NetworkInterfaceId) -> \(.Description)"'  | wc -l)
        public_ips=$(aws ec2 describe-addresses --profile "${environment}" --region "${region}" 2>&1 | jq '.Addresses | .[] | .PublicIp' | wc -l)
        printf "%40s \n" " " | tr ' ' '.'
        echo "   ${region}"
        echo "    * EC2 Count: ${nodes_count}"
        echo "${nodes}"
        echo "    * Public IPs: ${public_ips}"
        echo "    * Network intefaces: ${network_intefaces}"
    fi
done
