# AWS CLI Dashboard
With this project, you can quickly see how many resources do you have cross accounts and regions. 
You should clone the project and run the  `dashboard.sh`, and then you see everything in one sight. 


## Installation
Clone the project.
Define your environments in this path ~/.aws/environments
like this

```bash
declare -a environments=("development" "staging" "production")

```

Then run your dashboard like this

```bash
bash ./dashboard.sh ~/.aws/environments
```

And you will get something like this
```
=============================================================
Production:
-------------------------------------------------------------
EC2:
.........................................
   us-west-1
    * EC2 Count: 210
      100 t3a.large
      110 t2.micro
    * VPC Count: 6
      "172.30.0.0/16"
      "10.10.0.0/16"
      "10.11.0.0/16"
      "10.12.0.0/16"
      "10.13.0.0/16"
      "10.14.0.0/16"
    * Public IPs: 120
    * Network intefaces: 321
.........................................
   us-west-2
    * EC2 Count: 55
      30 t3.medium
      10 t3.xlarge
      12 t3.large
      3 t2.nano
    * VPC Count: 6
      "172.30.0.0/16"
      "10.10.0.0/16"
      "10.11.0.0/16"
      "10.12.0.0/16"
      "10.13.0.0/16"
      "10.14.0.0/16"
    * Public IPs: 30
    * Network intefaces: 90
-------------------------------------------------------------
RDS:
   * By Instance Type
      5 "db.t3.medium"
   * By Engine Type
      2 "postgres"
      3 "mysql"
-------------------------------------------------------------
ECR:
      212 "us-west-1"
-------------------------------------------------------------
S3:
      12
-------------------------------------------------------------
Lambda:
      34 "us-west-1"

=============================================================
Staging:
-------------------------------------------------------------
EC2:
.........................................
   us-west-2
    * EC2 Count: 1
      1 t3.xlarge
    * VPC Count: 1
      "172.30.0.0/16"
    * Public IPs: 1
    * Network intefaces: 1
-------------------------------------------------------------
RDS:
   * By Instance Type
      1 "db.t3.medium"
   * By Engine Type
      1 "postgres"
-------------------------------------------------------------
ECR:
      5 "us-west-1"
-------------------------------------------------------------
S3:
      12
-------------------------------------------------------------
Lambda:
      1 "us-west-1"
```
