printf "%60s \n" " " | tr ' ' '-'
echo "VPC:"
for region in $(aws ec2 describe-regions --profile "${environment}" --query 'Regions[].RegionName | sort(@)' --output text); \
do 
    vpc_cidr_count=$(aws ec2 describe-vpcs --profile development --region "${region}" 2>&1 | jq '.Vpcs | .[] | .CidrBlock' | wc -l)

    if  [ "${vpc_cidr_count}" -ne "1" ];
    then
        vpc_cidr=$(aws ec2 describe-vpcs --profile development --region "${region}" 2>&1 | jq '.Vpcs | .[] | .CidrBlock' | sed "s/^/      /" )
        printf "%40s \n" " " | tr ' ' '.'
        echo "   ${region}"
        echo "    * VPC Count: ${vpc_cidr_count}"
        echo "${vpc_cidr}"
    fi
done
