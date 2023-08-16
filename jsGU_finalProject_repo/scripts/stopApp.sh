#!/usr/bin/env bash

value="$(netstat -nap | grep 8080)" 

# value="(Not all processes could be identified, non-owned process info
#  will not be shown, you would have to be root to see it all.)
# tcp6 0 0 :::8080 :::* LISTEN 12315/java"

if [[ "$value" == *8080* ]]; then
    arr="$(lsof -nP -iTCP:8080|awk '{print $2}')"
    target=${arr:4}
    kill -9 $target
    echo "kill boot port 8080"
else
    echo "pid file is not exist...pass kill process"
fi

rm -rf /home/ec2-user/deploy/
mkdir -p /home/ec2-user/deploy/