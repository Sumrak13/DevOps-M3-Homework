#!/bin/bash
echo "* Working within Vagrant Synced Folder ..."
cd /vagrant
echo "* Creating secret for  ..."
echo '12345' | docker secret create db_root_password -
echo "* deploy stack to swarm - BGAPP ..."
docker stack deploy -c docker-compose-swarm.yaml bgapp
echo "==========================================================================="
echo "=  DOCKER SWARM MASTER = DOCKER1 | STACK DEPLOYED = OK | NEXT NODE 2 of 3 ="
echo "==========================================================================="