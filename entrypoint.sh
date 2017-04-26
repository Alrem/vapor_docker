#!/bin/bash
test $DEBUG && set -x && CMD='echo'

function download_vapor {
	echo -n 'It is not a vapor repository. Download it (all information in the vapor directory will be removed? (Y/n) '
	read item
	case "$item" in
		y|Y) echo '"vapor" will be downloaded. Please correct exports.sh and re-run tests'
			 git clone https://github.com/openstack/fuel-plugin-contrail.git
			 rm -rf vapor/*
			 mv fuel-plugin-contrail/plugin_test/vapor ./
			 exit 0
	        ;;
	    n|N) echo "Please fix it and re-run tests"
			 exit 0
	        ;;
	esac
}


if [ ! -d vapor ]; then
  echo 'Directory is not mount'
  exit 1
fi

test -a vapor/exports.sh || download_vapor

cd vapor
. exports.sh 
pip install -U -r requirements.txt
DATE=`date +%Y%m%d%H%M`
$CMD py.test -v --junit-xml=test_reports$DATE/report.xml --html=test_reports$DATE/report.html $@ -k "$K_PARAM"

test $DEBUG && /bin/bash
