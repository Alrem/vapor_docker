#!/bin/bash
if [ -d vapor ]; then
  cd vapor
  . exports.sh
  pip install -r requirements.txt
  DATE=`date +%Y%m%d%H%M`
  py.test -v --junit-xml=test_reports$DATE/report.xml --html=test_reports$DATE/report.html $*
else
  echo 'Directory is not mount'
fi
