#!/bin/bash

mkdir -m 755 -p /opt/dokuwiki/

# Install dependencies
apt-get update
apt-get install -y -q apache2 libapache2-mod-php5

# Checkout the source code of dokuwiki
mkdir -p /tmp/dokuwiki
cd /tmp/dokuwiki
wget http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
tar xvf dokuwiki-stable.tgz

# Move to www folder
mv /tmp/dokuwiki/dokuwiki-*/* /var/www
chown -R www-data:www-data /var/www
rm -rf /tmp/dokuwiki

# Install scripts
install -m 755 /home/source/rc.local /etc
install -m 644 /home/source/default.apache_template /etc/default.apache_template
install -m 644 /home/source/ports.conf.apache_template /etc/ports.conf.apache_template

exit 0
