#! /bin/bash

echo " ---> SCRIPT FOR STUB HOST"
host_name=$(hostname)
host_ip=$(hostname -I)
echo "SERVER : ${host_name}"
echo "IP : ${host_ip}"

# kill any other stubs processes:
kill -9 $(ps aux | grep 'stub-1.jar' | grep -v grep | awk '{print $2}')

current_dir=$(pwd)
echo "Current dir: ${current_dir}"
cd stub/
current_dir=$(pwd)
echo "Current dir: ${current_dir}"


mvn package && nohup java -jar -Dserver.port=1235 ./target/stub-1.jar > /dev/null 2>&1 &