#!/bin/bash
source "/vagrant/scripts/common.sh"

#https://cwiki.apache.org/confluence/display/AMBARI/Install+Ambari+2.0.1+from+Public+Repositories
function installAmbari {
	sed -e "s/14.04/12.04/g" -i /etc/*-release
}

echo "setup Ambari Slave"
installAmbari