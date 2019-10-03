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
production:
   eu-west-1
      21 t3.small
      12 t3.large
   us-west-2
      91 t3.medium
      42 t3.xlarge
staging:
   eu-west-1
      11 t3a.large
   us-west-1
      15 t3.medium

```