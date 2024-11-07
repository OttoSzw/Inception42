FROM debian:bullseye

RUN apt update && apt upgrade -y 

RUN apt-get install php curl wget php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt-get install default-mysql-client -y
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

RUN apt-get install iputils-ping -y
RUN apt-get install vim -y


COPY tools/install.sh /home/
RUN chmod 755 /home/install.sh

EXPOSE 9000

ENTRYPOINT ["/home/install.sh" ] 
