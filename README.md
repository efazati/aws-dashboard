# AWS Dashboard

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
    * Public IPs: 120
    * Network intefaces: 321
      100 t3a.large
      110 t2.micro
.........................................
   us-west-2
    * EC2 Count: 55
    * Public IPs: 30
    * Network intefaces: 90
      30 t3.medium
      10 t3.xlarge
      12 t3.large
      3 t2.nano
-------------------------------------------------------------
RDS:
.........................................
   * By Instance Type
      5 "db.t3.medium"
   * By Engine Type
      2 "postgres"
      3 "mysql"
=============================================================
Staging:
-------------------------------------------------------------
EC2:
.........................................
   us-west-2
    * EC2 Count: 1
    * Public IPs: 1
    * Network intefaces: 1
      1 t3.xlarge
-------------------------------------------------------------
RDS:
.........................................
   * By Instance Type
      1 "db.t3.medium"
   * By Engine Type
      1 "postgres"

```