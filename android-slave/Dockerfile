FROM snowdream/android:24

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

COPY id_rsa ${JENKINS_USER_HOME}/.ssh/
COPY id_rsa.pub ${JENKINS_USER_HOME}/.ssh/
COPY id_rsa.pub ${JENKINS_USER_HOME}/.ssh/authorized_keys
RUN chmod 400 ${JENKINS_USER_HOME}/.ssh/id_rsa

RUN chown -R ${user} "${JENKINS_HOME}" &&  mkdir -p "${JENKINS_USER_HOME}" && chown -R ${user}  "${JENKINS_USER_HOME}"

ENTRYPOINT ["/bin/bash", " while 1"]