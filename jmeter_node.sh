#! /bin/bash

echo " ---> SCRIPT FOR JMETER NODE"
host_name=$(hostname)
host_ip=$(hostname -I)
echo "SERVER : ${host_name}"
echo "	  IP : ${host_ip}"