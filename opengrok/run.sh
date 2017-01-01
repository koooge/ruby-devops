#!/bin/sh

/opengrok/bin/OpenGrok deploy

service tomcat7 start
svn co https://svn.ruby-lang.org/repos/ruby/trunk /src/trunk
/opengrok/bin/OpenGrok index

while true
do
  sleep 43200
  svn update /src/trunk
  /opengrok/bin/OpenGrok index
done
