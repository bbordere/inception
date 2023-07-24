FROM	alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/bbordere.pem \
        -keyout /etc/nginx/ssl/bbordere.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=bbordere/OU=bbordere/CN=bbordere/"

ADD	https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY tools/run.sh /scripts/run.sh

# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
ENTRYPOINT [ "sh", "/scripts/run.sh" ]