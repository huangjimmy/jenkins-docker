FROM openjdk:8-jdk

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_USER_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container, 
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_HOME}" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install maven gradle

COPY id_rsa /var/jenkins_home/.ssh/
COPY id_rsa.pub /var/jenkins_home/.ssh/
COPY id_rsa.pub  /var/jenkins_home/.ssh/authorized_keys 
RUN  chmod 400 /var/jenkins_home/.ssh/id_rsa && chown -R ${user} /var/jenkins_home