#!/bin/bash

# creates two volumes to store the data inside of the container
docker volume create --name bitbucketVolume
docker volume create --name jenkinsVolume

# if no images found docker will pull, build and start them for you. 
docker run  --name bitbucket -d -p 7990:7990 -p 7999:7999 -v bitbucketVolume:/var/atlassian/application-data/bitbucket  atlassian/bitbucket
docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkinsVolume:/var/jenkins_home jenkins/jenkins:lts

# bitbucket needs an account to get the licence key. :(
# docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword in the local console if the container is fully started.
# note there is no start always configured you have to do it via console after each reboot or if u stopped them.