FROM alpine

MAINTAINER HuoBan Docker Maintainers "docker@huoban.com"
# install php-core-extensions
ENV PHP_VERSION 7.1.0

RUN set -x \
  && addgroup -g 82 -S www-data \
  && adduser -u 82 -D -S -G www-data www-data

ENV CONFIG "\
	--with-config-file-path=/usr/local/etc/php \
        --with-config-file-scan-dir=/usr/local/etc/php/conf.d \
        --enable-fpm \
        --with-fpm-user=www-data \
        --with-fpm-group=www-data \
        --disable-cgi \
        --enable-mysqlnd \
        --enable-mbstring \
        --with-curl \
        --with-libedit \
        --with-openssl \
        --with-zlib \
        --enable-zip \
	"
RUN \
    apk add --no-cache autoconf \
	curl \
	gcc \
	g++ \
	zip \
	make \
	xz \
	openssl \
	freetype \
	libpng \
	openssl-dev \
	libjpeg-turbo \
	curl-dev \
	freetype-dev \
	libpng-dev \
	libjpeg-turbo-dev \
	libmcrypt-dev \
	libxml2-dev \
	libedit-dev  \
    && curl -fSL https://secure.php.net/get/php-7.1.0.tar.xz/from/this/mirror -o php.tar.xz \
    && mkdir -p /usr/src \
    && tar -Jxf php.tar.xz -C /usr/src \
    && rm php.tar.xz \
    && cd /usr/src/php-$PHP_VERSION \
    && ./configure $CONFIG \
    && make \
    && make install \
    && mv /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf \
    && sed -i s@include=NONE@include=/usr/local@g /usr/local/etc/php-fpm.conf \
    && mv /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf \
    && rm -rf /usr/src/php-$PHP_VERSION

EXPOSE 9000

CMD ["php-fpm"]
