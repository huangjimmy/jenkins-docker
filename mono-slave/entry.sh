#!/bin/bash
service ssh start
/bin/tini -- /usr/local/bin/jenkins.sh