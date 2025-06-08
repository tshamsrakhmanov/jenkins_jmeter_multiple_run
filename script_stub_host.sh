#! /bin/bash


#
# welcome message
#
echo " #########################"
echo " ---> SCRIPT FOR STUB HOST"
echo " #########################"
host_name=$(hostname)
host_ip=$(hostname -I)
echo "SERVER : ${host_name}"
echo "IP : ${host_ip}"
echo "$(whoami)"

#
# kill any other stubs processes:
#
echo " #########################"
echo " ---> TRY TO KILL STUB PROCESSES"
echo " #########################"
kill -9 $(ps aux | grep 'stub-1.jar' | grep -v grep | awk '{print $2}')

#
# stop all docker containers
#
echo " #########################"
echo " ---> STOP DOCKER CONTAINERS"
echo " #########################"
sudo -s docker stop $(sudo docker ps -a -q) && sudo -s docker rm $(sudo docker ps -a -q)

#
# remove all previous docker images
#
echo " #########################"
echo " ---> TRY TO REMOVE ALL DOCKER IMAGES"
echo " #########################"
docker rmi -f $(docker images -aq)


#
# build stub JAR
#
echo " #########################"
echo " ---> BUILD STUB JAR"
echo " #########################"
current_dir=$(pwd)
echo "Current dir: ${current_dir}"
cd stub/
current_dir=$(pwd)
echo "Current dir: ${current_dir}"

mvn package