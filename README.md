vagrant-Ambari-2.0
================================

# Introduction

Vagrant project to spin up a cluster of 6 virtual machines with Ambari v2.0 and HDP v2.2.6. Java/Ant/Maven/Scala/R/Docker environment is setup in all the nodes.

1. node1 : Ambari Service + HDP management node
2. node2 : HDP management node
3. node3 : HDP management node
4. node4 : HDP compute node
5. node5 : HDP compute node
6. node6 : HDP compute node

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Run ```vagrant box add ubuntu https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box```
4. Git clone this project, and change directory (cd) into this project (directory).
5. Run ```vagrant up``` to create the VM.
6. Run ```vagrant ssh``` to get into your VM. The VM name in vagrant is ambarinode1, ambarinode2 ... ambarinoden. While the ip of VMs depends on the scale of your Yarn cluster. If it is less then 10, the IP will be 10.211.75.101, .... 10.211.75.10n. Or you could run ```ssh``` directly with ip of VMs and username/password of demo/demo, and then execute "su - root" with password of vagrant.
7. Run ```vagrant destroy``` when you want to destroy and get rid of the VM.
8. The directory of /vagrant is mounted in each VM by vagrant if you want to access host machine from VM. You could also use win-sshfs if you want to access the local file system of VM from host machine. Please refer to http://code.google.com/p/win-sshfs/ for details.

Some gotcha's.

* Make sure you download Vagrant v1.7.1 or higher and VirtualBox 4.3.20 or higher with extension package
* Make sure when you clone this project, you preserve the Unix/OSX end-of-line (EOL) characters. The scripts will fail with Windows EOL characters. If you are using Windows, please make sure the following configuration is configured in your .gitconfig file which is located in your home directory ("C:\Users\yourname" in Win7 and after, and "C:\Documents and Settings\yourname" in WinXP). Refer to http://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration for details of git configuration.
```
[core]
    autocrlf = false
    safecrlf = true
```
* Make sure you have 10Gb of free memory for the VMs. You may change the Vagrantfile to specify smaller memory requirements.
* This project has NOT been tested with the other providers such as VMware for Vagrant.
* You may change the script (common.sh) to point to a different location for Hadoop, Zookeeper .... to be downloaded from. 

# Advanced Stuff

If you have the resources (CPU + Disk Space + Memory), you may modify Vagrantfile to have even more HDFS DataNodes, YARN NodeManagers, and Spark slaves. Just find the line that says "numNodes = 6" in Vagrantfile and increase that number. The scripts should dynamically provision the additional slaves for you.

# Make the VMs setup faster
You can make the VM setup even faster if you pre-download the Hadoop ... and Oracle JDK into the /resources directory.

* /resources/jdk-7u76-linux-x64.tar.gz
* ....

The setup script will automatically detect if these files (with precisely the same names) exist and use them instead. If you are using slightly different versions, you will have to modify the script accordingly.

# Access Point
Ambari WebGUI: http://10.211.55.101:8080
  username/password: admin/admin/ad
Postgre DB:
  username/password:

# Install Hadoop with Ambari

Replace /usr/lib/python2.6/site-packages/resource_management/core/providers/package/apt.py by /vagrant/resources/apt.py to add option of apt get of "-o Dpkg::Options::=--force-overwrite"

# Vagrant boxes
A list of available Vagrant boxes is shown at http://www.vagrantbox.es. 

# Vagrant box location
The Vagrant box is downloaded to the ~/.vagrant.d/boxes directory. On Windows, this is C:/Users/{your-username}/.vagrant.d/boxes.

# Copyright Stuff
Copyright 2015

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
