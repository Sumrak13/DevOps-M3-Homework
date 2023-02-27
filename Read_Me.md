# RUN command: vagrant up
It does:

# Vagrant will create 3 virutal machines in VirtualBox:
	docker1,docker2,docker3 @ .do1.lab
	Private_network: 192.168.99.101-103
	vCPU=2
	vRAM=2
	
# Provision the machines:
	docker-setup.sh // install docker on vm hosts
	common-steps.sh // dnf install -y jq tree git nano vim, firewall and DNS
	docker-compose-swarm.yaml // used for creating the swarm cluster
	create-swarm.sh // Install and configure the cluster
	join-swarm.sh // join to the cluster
	deploy-stack-bgapp.sh // create Secret: and Deploy the Stack with 2 Services 5 Replicas
		create-db-srv.sh // Create DB Service on swarm
		create-web-srv.sh // Create WEB Service on swarm
		Dockerfile // used for creating 
		Dockerfile.db  // used for create the: docker-db container
		Dockerfile.web // used for: docker-web container

# Shared_Data:
	Sharad_Data/Web
	Sharad_Data/DB
	Sharad_Data/Other

# Scripts for creating the images are included in ./Integration
	image-DB (uploaded to hub.docker.com)
	image-WEB (uploaded to hub.docker.com)
	
# Project Target: --------------------------------------------------------------
#	Vagrant up to create 3 VM docker hosts, provisioning
#	1 Docker swarm Service with 2 Tasks
#		Task1: nginx with Replica factor = 3
#		Task2: mariadb with 1 replica
#		optional: TEST with GLOBAL replication model
#	WWW IPs: 192.168.99.100, 192.168.99.101, 192.168.99.102

# To be updated:
	To crate and upload self created images for bgapp, or another application
	Upload the images to hub.docker.com, github.com
	Make application to work with git, not with Vagrant Share

# Test the application after deploy
On successfull deploy you will read: All Done :) massage
http://192.168.99.100:8080 - to check the application
on docker1 run commands:
docker node ls
docker stack ls
docker stack ps bgapp
docker container ps -a
docker service scale bgapp_db=1
docker service scale bgapp_web=5
docker service update --force bgapp_web
docker container prune
docker stack ps bgapp