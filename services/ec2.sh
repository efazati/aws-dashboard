printf "%60s \n" " " | tr ' ' '-'
echo "EC2:"
for region in $(aws ec2 describe-instances --profile "${environment}"  2>&1 | jq '.Reservations[].Instances[].PrivateDnsName | split(".") | .[1]' | uniq | sed 's/\"//g'); \
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
        nodes_count=$(aws ec2 describe-instances \
            --region "${region}" \
            --filter Name=instance-state-name,Values=running  --profile "${environment}"  \
            --query 'Reservations[].Instances[].{InstanceType:InstanceType}' \
            | jq -r '.[].InstanceType' \
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
