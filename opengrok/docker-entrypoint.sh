#!/bin/bash

DURATION=43200
GROK_BIN=/opengrok/bin/OpenGrok
GROK_SRC=/var/opengrok/src

OPENGROK_TOMCAT_BASE=/usr/local/tomcat ${GROK_BIN} deploy
/usr/local/tomcat/bin/catalina.sh start

svn co https://svn.ruby-lang.org/repos/ruby/trunk ${GROK_SRC}/ruby --non-interactive
git clone https://github.com/mruby/mruby.git ${GROK_SRC}/mruby
${GROK_BIN} index

while true
do
    sleep ${DURATION}
    svn update ${GROK_SRC}/ruby --non-interactive
    git pull ${GROK_SRC}/mruby
    ${GROK_BIN} index
done
