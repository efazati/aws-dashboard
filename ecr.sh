printf "%60s \n" " " | tr ' ' '-'
echo "ECR:"
images=$(aws ecr describe-repositories --profile  ${environment}  2>&1 | jq '.repositories | .[] | .repositoryArn |  split(":") | .[3]' | sort | uniq -c | sort -r)
if  [ ! -z "$images" ]
then
    printf "%40s \n" " " | tr ' ' '.'
    echo "${images}"

fi

