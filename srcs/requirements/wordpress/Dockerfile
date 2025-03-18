FROM alpine:3.20.5

RUN apk add --update --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-openssl \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-mbstring \
    php83-xml \
    php83-zip \
    curl

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz --strip-components=1 && \
	rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php83/php-fpm.d/www.conf

CMD ["php-fpm83", "-F"]