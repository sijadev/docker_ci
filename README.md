# jenkins_gitlab

# Docker Comands:

docker container inspect <id>:
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

# Jenkins

get plugins from existing container
get docker ip with: docker container inspect <id>
Use the created user and password
--------------------------------------------------  
JENKINS_HOST='user:password@<docker-ip>:8080'
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'

