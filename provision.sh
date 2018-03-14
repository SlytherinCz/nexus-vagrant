#!/bin/sh
apt-get update
apt-get install -y default-jdk
mkdir /opt/nexus
cd /home/vagrant/shared
wget https://download.sonatype.com/nexus/3/nexus-3.9.0-01-unix.tar.gz
tar -xvzf /home/vagrant/shared/nexus-3.9.0-01-unix.tar.gz -C /opt/nexus
rm /home/vagrant/shared/nexus-3.9.0-01-unix.tar.gz
sed -i "s/run_as_user=''/run_as_user='nexus'/" /opt/nexus/nexus-3.9.0-01/bin/nexus
#cp /home/vagrant/shared/nexus.vmoptions /opt/nexus/nexus-3.9.0-01/bin/
chmod +x /opt/nexus/nexus-3.9.0-01/bin/nexus
adduser --disabled-password --gecos "" nexus
chown -R nexus:nexus /opt/nexus
su nexus
/opt/nexus/nexus-3.9.0-01/bin/nexus start