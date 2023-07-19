FROM alpine:3.17

RUN	apk update; apk upgrade; apk add --no-cache mariadb mariadb-client

RUN mkdir scripts

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY run.sh scripts/run.sh

RUN mkdir -p /run/mysqld; chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "scripts/run.sh" ]
