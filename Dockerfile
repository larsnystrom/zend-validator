FROM php:5.6-cli

RUN apt-get update && \
	apt-get install -y libicu-dev zlib1g-dev git libmcrypt-dev && \
	docker-php-ext-install -j$(nproc) intl zip mcrypt && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    adduser --disabled-password --gecos "" app && \
    mkdir -p /usr/src/app && \
    chown app:app -R /usr/src/app

RUN apt-get install -y nano && \
    echo "alias ll=\"ls -lah\"" >> /etc/profile.d/00-aliases.sh && \
    echo "alias l=\"ls\"" >> /etc/profile.d/00-aliases.sh

WORKDIR /usr/src/app
USER app
CMD bash -l
