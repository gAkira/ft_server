# uses debian buster image from Dockerhub
FROM debian:buster

# update/upgrade and then install programs needed
RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y \
		nginx \
		mariadb-server \
		openssl \
		php7.3 php-fpm php-mysql php-cli php-mbstring

# copy source files to the container
COPY srcs /tmp/srcs

# configure services
RUN bash /tmp/srcs/setup.sh

# expose ports 80 [HTTP] and 443 [HTTPS]
EXPOSE 80 443

# start services
ENTRYPOINT bash /tmp/srcs/start.sh





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

