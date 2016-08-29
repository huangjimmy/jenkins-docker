FROM jenkinsci/jenkins:2.19

USER root

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install maven mono-complete gradle && mkdir -p /var/jenkins_home/.ssh/

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

COPY id_rsa /var/jenkins_home/.ssh/
COPY id_rsa.pub /var/jenkins_home/.ssh/
COPY id_rsa.pub  /var/jenkins_home/.ssh/authorized_keys 
RUN  chmod 400 /var/jenkins_home/.ssh/id_rsa && chown -R ${user} /var/jenkins_home