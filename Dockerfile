FROM debian:buster

ADD /srcs/database.sql /tmp/

RUN apt-get update		&&	\
	apt-get -y upgrade	&&	\
	apt-get install -y		\
		wget				\
		nginx				\
		mariadb-server		\
		php-mysql			\
		php-fpm				\
		php-cli

RUN wget https://wordpress.org/latest.tar.gz	&&	\
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz

RUN mkdir -p /var/www/html /var/www/info					&&	\
	tar	-xf latest.tar.gz -C /var/www/						&&	\
	tar -xf phpMyAdmin-4.9.5-all-languages.tar.gz			&&	\
	mv phpMyAdmin-4.9.5-all-languages /var/www/phpmyadmin	&&	\
	rm latest.tar.gz											\
		phpMyAdmin-4.9.5-all-languages.tar.gz				&&	\
	chown -R $USER:$USER /var/www/*							&&	\
	chown -R www-data:www-data /var/www/*					&&	\
	chmod -R 755 /var/www/*									&&	\
	service mysql start										&&	\
	mysql -u root --password= < /tmp/database.sql		&&	\
	yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

ADD /srcs/server.conf /etc/nginx/sites-available/server.conf
ADD /srcs/info.php /var/www/info/info.php
ADD /srcs/wp-config.php /var/www/wordpress/wp-config.php
ADD /srcs/config.inc.php /var/www/phpmyadmin/config.inc.php
ADD /srcs/index.sh /tmp/index.sh

RUN chmod 755 /var/www/phpmyadmin/config.inc.php				&&	\
	ln -s /etc/nginx/sites-available/server.conf					\
			/etc/nginx/sites-enabled/							&&	\
	echo "alias index='bash /tmp/index.sh'" >> /root/.bashrc

EXPOSE 80 443

CMD service nginx restart				&&	\
	service mysql start					&&	\
	service php7.3-fpm start			&&	\
	bash /tmp/index.sh $index	&&	\
	bash








#              ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#              ░░░░░░░░░░▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄░░░░░░░░░
#              ░░░░░░░░▄▀░░░░░░░░░░░░▄░░░░░░░▀▄░░░░░░░
#              ░░░░░░░░█░░▄░░░░▄░░░░░░░░░░░░░░█░░░░░░░
#              ░░░░░░░░█░░░░░░░░░░░░▄█▄▄░░▄░░░█░▄▄▄░░░
#              ░▄▄▄▄▄░░█░░░░░░▀░░░░▀█░░▀▄░░░░░█▀▀░██░░
#              ░██▄▀██▄█░░░▄░░░░░░░██░░░░▀▀▀▀▀░░░░██░░
#              ░░▀██▄▀██░░░░░░░░▀░██▀░░░░░░░░░░░░░▀██░
#              ░░░░▀████░▀░░░░▄░░░██░░░▄█░░░░▄░▄█░░██░
#              ░░░░░░░▀█░░░░▄░░░░░██░░░░▄░░░▄░░▄░░░██░
#              ░░░░░░░▄█▄░░░░░░░░░░░▀▄░░▀▀▀▀▀▀▀▀░░▄▀░░
#              ░░░░░░█▀▀█████████▀▀▀▀████████████▀░░░░
#              ░░░░░░████▀░░███▀░░░░░░▀███░░▀██▀░░░░░░
#              ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
