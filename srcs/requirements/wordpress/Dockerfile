FROM alpine:3.20.5

RUN apk add --update --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-openssl \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-xml \
    php8-zip \
    curl

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz --strip-components=1 && \
	rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php8/php-fpm.d/www.conf

CMD ["php-fpm8", "-F"]