FROM php:7.2.2-fpm

RUN echo "deb [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" > /etc/apt/sources.list
RUN echo "deb-src [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb [trusted=yes] http://archive.debian.org/debian-security stretch/updates main non-free contrib" >> /etc/apt/sources.list

RUN apt-get update -y && apt-get upgrade -y;
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libgeoip-dev unzip zlib1g-dev nano wget curl && rm -rf /var/lib/apt/lists/*;
RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && pecl install geoip-1.1.1 \
    && docker-php-ext-enable geoip

RUN curl -fsSL 'https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz' -o ioncube.tar.gz \
  && mkdir -p /tmp/ioncube \
  && tar -xvvzf ioncube.tar.gz \
  && mv ioncube/ioncube_loader_lin_7.2.so `php-config --extension-dir` \
  && rm -Rf ioncube.tar.gz ioncube \
  && docker-php-ext-enable ioncube_loader_lin_7.2

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data
RUN chown -R www-data:www-data /var/www
RUN rm /usr/local/etc/php-fpm.d/zz-docker.conf
RUN touch /var/log/phpslow.log
RUN mkdir -p /tmp/php
RUN chown -R www-data:www-data /tmp/php

WORKDIR /var/www/html
USER "${USER_ID}:${GROUP_ID}"

CMD ["php-fpm"]