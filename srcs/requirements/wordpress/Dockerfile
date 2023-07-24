FROM alpine:3.17

RUN		apk update && apk upgrade && apk add --no-cache \
		--repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/community \
		--repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/main \
			curl				\
			mariadb-client		\
			php7				\
			php7-phar			\
			php7-dev			\
			php7-fpm			\
			php7-iconv			\
			php7-intl			\
			php7-mysqli			\
			php7-json			\
			php7-curl			\
			php7-dom			\
			php7-exif			\
			php7-fileinfo		\
			php7-imagick		\
			php7-mbstring		\
			php7-openssl		\
			php7-zip


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /scripts
COPY tools/run.sh /scripts/run.sh
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
RUN adduser -S nginx && addgroup -S nginx

WORKDIR /var/www/html

RUN chmod +x /scripts/run.sh

ADD	https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

ENTRYPOINT [ "sh", "-c", "/scripts/run.sh"]