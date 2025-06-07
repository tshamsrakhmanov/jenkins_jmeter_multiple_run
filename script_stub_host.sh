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

mvn package

while [ ! -f "stub-1.jar" ]; do
	echo "wait for JAR file to compile"
    sleep 1  # Check every second
done

cd target/
current_dir=$(pwd)
echo "Current dir: ${current_dir}"


nohup java -jar stub-1.jar > stub-1.out 2>&1 &