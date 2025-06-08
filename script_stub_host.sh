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


# commented - due to not usability of a jar-run process under jenkins exec. all the processes just stops after finish of jenkins job.
#
# kill any other stubs processes:
#
# echo " #########################"
# echo " ---> TRY TO KILL STUB PROCESSES"
# echo " #########################"
# kill -9 $(ps aux | grep 'stub-1.jar' | grep -v grep | awk '{print $2}')

#
# stop all docker containers
#
echo " #########################"
echo " ---> STOP DOCKER CONTAINERS"
echo " #########################"
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

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

#
# build new image of stub
#
cd ..
current_dir=$(pwd)
echo "Current dir: ${current_dir}"
docker build -t stub_1 .

#
# build new image of stub
#

docker run -d stub_1:latest