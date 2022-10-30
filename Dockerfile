FROM php:5.6-fpm
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libgeoip-dev unzip zlib1g-dev nano wget curl htop nmap rsync;
RUN docker-php-ext-install mysql mysqli mbstring pdo pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install geoip-1.1.1 \
    && docker-php-ext-enable geoip

RUN curl -o ioncube.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_ppc64le.tar.gz \
    && tar -xvvzf ioncube.tar.gz \
    && mv ioncube_ppc64le/ioncube_loader_lin_5.6.so `php-config --extension-dir` \
    && rm -Rf ioncube.tar.gz ioncube_ppc64le \
    && docker-php-ext-enable ioncube_loader_lin_5.6

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data
RUN chown -R www-data:www-data /var/www
RUN rm /usr/local/etc/php-fpm.d/zz-docker.conf
WORKDIR /var/www/html
USER "${USER_ID}:${GROUP_ID}"

CMD ["php-fpm"]
