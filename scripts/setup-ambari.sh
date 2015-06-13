#!/bin/bash
source "/vagrant/scripts/common.sh"

#https://cwiki.apache.org/confluence/display/AMBARI/Install+Ambari+2.0.1+from+Public+Repositories
function installAmbari {
	echo "install Ambari from Public Repositories"
	cd /etc/apt/sources.list.d
	wget http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.1/ambari.list 
	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
	apt-get update
	apt-get install -y ambari-server
	ambari-server setup -s
	cp -f /vagrant/resources/os_check_type.py /usr/lib/python2.6/site-packages/ambari_server/
	sed -e "s/14.04/12.04/g" -i /etc/*-release
	ambari-server start
}

echo "setup Ambari"
installAmbari