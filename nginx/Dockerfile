FROM	alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/bbordere.pem \
        -keyout /etc/nginx/ssl/bbordere.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=bbordere/OU=bbordere/CN=bbordere/"


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]