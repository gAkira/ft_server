#!/bin/bash

# dir's
SRCS=/tmp/srcs
SERVER=/var/www
NGINX=/etc/nginx

# change directory to srcs
cd $SRCS

# setup nginx
mv nginx.conf $NGINX/sites-available/.
rm $NGINX/sites-enabled/default
ln -s $NGINX/sites-available/nginx.conf $NGINX/sites-enabled/.

# setup openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj '/C=BR/ST=SP/L=SAO_PAULO/O=42/OU=42SP/CN=galves-d' \
	-keyout /etc/ssl/certs/localhost.key \
	-out /etc/ssl/certs/localhost.crt

# setup phpMyAdmin
tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz
rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpMyAdmin-5.0.4-all-languages $SERVER/phpmyadmin
mv config.inc.php $SERVER/phpmyadmin/.
chown -R www-data:www-data $SERVER/phpmyadmin

# setup wordpress database on MySQL
service mysql start
mysql -u root --password= < $SRCS/mysql_setup.sql

# setup WordPress
tar -xf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress $SERVER/wordpress
mv wp-config.php $SERVER/wordpress/.

# setup phpinfo
mkdir -p $SERVER/infophp
mv info.php $SERVER/infophp/.

# setup script to control autoindex
echo "alias autoindex='bash $SRCS/autoindex.sh'" >> /root/.bashrc
