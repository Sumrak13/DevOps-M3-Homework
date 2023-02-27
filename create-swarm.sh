#!/bin/bash
echo "* Working within Vagrant Synced Folder ..."
cd /vagrant
echo "* Docker Swarm Initialization ..."
docker swarm init --advertise-addr 192.168.99.100
echo "* Docker Swarm Join-Tocken export ..."
JOIN_TOKEN=$(docker swarm join-token worker -q)
echo $JOIN_TOKEN > JOIN_TOKEN.txt
