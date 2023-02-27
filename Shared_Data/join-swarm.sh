#!/bin/bash
echo "* enter vagrant folder ..."
cd /vagrant
echo "* read $HOSTENAME ..."
HOSTNAME=$(cat /etc/hostname)
echo "* Read Docker JOIN_TOKEN ..."
JOIN_TOKEN=$(cat /vagrant/JOIN_TOKEN.txt)
echo "* Display JOIN_TOKEN ..."
echo $JOIN_TOKEN
if [ $HOSTNAME == "docker2.do1.lab" ]; then
echo "* Adding as worker node docker2 ..."
	docker swarm join --token $JOIN_TOKEN --advertise-addr 192.168.99.101 192.168.99.100:2377
echo "==========================================================================="
echo "=  DOCKER2 RUNNING AS WORKER = OK | NEXT NODE 3 of 3 CONTINUE TO CONFING  ="
echo "==========================================================================="
else
echo "* Adding as worker node docker3 ..."
	docker swarm join --token $JOIN_TOKEN --advertise-addr 192.168.99.102 192.168.99.100:2377
echo "--------------------------------- FINISHED --------------------------------"
echo "==========================================================================="
echo "=  DOCKER SWARM MASTER = DOCKER1 | STACK DEPLOYED = OK | ALL DONE VAGRANT ="
echo "==========================================================================="
echo "---------------------------------- BYE ------------------------------------"
fi 
