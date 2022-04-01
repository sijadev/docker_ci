# jenkins_gitlab

# Docker Comands:

docker container inspect <id or name>:
------------------------------ 

docker images

docker ps -a


docker container commit CONTAINER IMAGES:
-----------------------------------------

docker container commit jenkins jenkins/jenkins:lts

docker container commit gitlab store/gitlab/gitlab-ce

container bash as root:
-----------------------  
docker exec -u 0 -it containerName bash

docker exec -u 0 -it jenkins bash

docker exec -u 0 -it gitlab bash

run image with bash:
--------------------
  
docker run -t -i --privileged <image> bash

start & stop containers:
------------------------ 

docker start gitlab jenkins

docker stop jenkins gitlab

# Gitlab:

1. Add in the/etc/hosts file: 
      127.0.0.1  gitlab-dev.com
2. open local bash and connect to gitlab container
    - docker exec -u 0 -it gitlab bash
3. Change the root pwd with: gitlab-rake 'gitlab:password:reset[root]
2. gitlab account
   Log in with root account add under root settings/ssh keys
   public key exsample from ur .ssh folder
3. Create a project and follow the instructions 

More infos for jenkins integration: https://docs.gitlab.com/ee/integration/jenkins.html
  
# Jenkins:

1. During the build appears the init password for jenkins !
   - copy it from the console .. or 
        - docker exec -u 0 -it jenkins bash
        - cat /var/lib/jenkins/secrets/initialAdminPassword
   - http://127.0.0.1:8080/ and paste the password.
   - All need plugins are already installed --> Initial plugins

get plugins from existing container
get docker ip with: docker container inspect <id>
Use the created user and password
--------------------------------------------------  
JENKINS_HOST='user:password@<docker-ip>:8080'
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'

