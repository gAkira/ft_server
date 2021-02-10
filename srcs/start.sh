#!/bin/bash

# start services
service nginx start
service mysql start
service php7.3-fpm start

# keep container running
tail -f /dev/null
