FROM jenkins/jenkins:lts
USER root
RUN apt-get update &&  apt-get install -y python3 python3-pip python3-venv
USER jenkins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
