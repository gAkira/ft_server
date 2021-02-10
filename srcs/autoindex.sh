#!/bin/bash

case $1 in
		"on")
			echo -e "\e[32mAutoindex is active\e[39m"
			sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/nginx.conf
			service nginx restart
			echo  ""
			;;
		"off")
			echo -e "\e[31mAutoindex is unactive\e[39m"
			sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/nginx.conf
			service nginx restart
			echo ""
			;;
		*)
			echo -e "\e[31mError this value does not exist in the index"
			echo -n -e "\e[32mautoindex is : "
			echo | grep '\(autoindex on\|autoindex off\)' /etc/nginx/sites-enabled/nginx.conf | cut -c13-
			echo -e "\e[39m"
			;;
esac