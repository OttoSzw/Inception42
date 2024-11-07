FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt-get install nginx -y

RUN apt-get install vim -y    

RUN apt-get install curl -y

RUN mkdir -p /etc/nginx/ssl && chmod -R 755 /etc/nginx/ssl

RUN apt-get install openssl -y

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/inception.key \
            -out /etc/nginx/ssl/inception.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=oszwalbe.42.fr/UID=oszwalbe'

# RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf

# RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
# COPY ./conf/ssl-params.conf /etc/nginx/snippets/

# COPY ./conf/default    /etc/nginx/sites-available/

# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=oszwalbe.42.fr/UID=oszwalbe"

RUN mkdir -p /var/run/nginx

COPY ./conf/default /etc/nginx/sites-available/default
# COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]