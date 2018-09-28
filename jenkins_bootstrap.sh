#!/bin/bash
source jenkins-bootstrap-shared/jenkins_bootstrap.sh

jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-markup-formatter.groovy"
jenkins_console -s ./configs/jenkins-settings.groovy -s "${SCRIPT_LIBRARY_PATH}"/configure-jenkins-settings.groovy
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-jnlp-agent-protocols.groovy"

# optionally configure oauth creds
[ ! -f ./configs/github-oauth.groovy ] || jenkins_console -s ./configs/github-oauth.groovy -s "${SCRIPT_LIBRARY_PATH}"/configure-github-oauth.groovy
