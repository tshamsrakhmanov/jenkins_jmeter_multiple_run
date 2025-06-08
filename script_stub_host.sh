#! /bin/bash


#
# welcome message
#
echo " ---> SCRIPT FOR STUB HOST"
host_name=$(hostname)
host_ip=$(hostname -I)
echo "SERVER : ${host_name}"
echo "IP : ${host_ip}"

#
# kill any other stubs processes:
#
kill -9 $(ps aux | grep 'stub-1.jar' | grep -v grep | awk '{print $2}')

#
# stop all docker containers
#
sudo docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)

#
# remove all previous docker images
#
docker rmi -f $(docker images -aq)


#
# build stub JAR
#

current_dir=$(pwd)
echo "Current dir: ${current_dir}"
cd stub/
current_dir=$(pwd)
echo "Current dir: ${current_dir}"

mvn package