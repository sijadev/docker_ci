# jenkins_gitlab

Requirements:
- docker and docker-compose is installed.

Installation:
- cd docker_ci
- if you want to change the path of the data folder --> .env
- open terminal: docker-compose up 

# Gitlab:

- docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
  returns the password for root
- http://127.0.0.1:80  log in with the root account.

More infos for jenkins integration: https://docs.gitlab.com/ee/integration/jenkins.html
  
# Jenkins:

- docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
- http://127.0.0.1:8080/ and paste the password.
- All need plugins are already installed --> Initial plugins

# Notes:
if want using the docker command script add in your .bashrc:

alias dcs='the path of the script/docker-commands.sh'
