printf "%60s \n" " " | tr ' ' '-'
echo "VPC:"
for region in $(aws ec2 describe-regions --profile "${environment}" --query 'Regions[].RegionName | sort(@)' --output text); \
do 
    raw_vpc_cidr=$(aws ec2 describe-vpcs --profile development --region "${region}" 2>&1 | jq '.Vpcs | .[] | .CidrBlock')
    vpc_cidr_count=$(echo ${raw_vpc_cidr} \
        | tr " " "\n" \
        | wc -l)

    if  [ "${vpc_cidr_count}" -ne "1" ];
    then
        vpc_cidr=$(echo ${raw_vpc_cidr} \
            | tr " " "\n" \
            | sed "s/^/      /" )
        printf "%40s \n" " " | tr ' ' '.'
        echo "   ${region}"
        echo "    * VPC Count: ${vpc_cidr_count}"
        echo "${vpc_cidr}"
    fi
done
