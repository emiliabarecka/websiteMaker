# Użyj oficjalnego obrazu PHP z Apache
FROM php:8.2-apache

RUN apt update && \
    apt install -y \
    zip unzip curl vim nano && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt install -y nodejs
RUN apt install -y npm

# Add non-root user
RUN echo "Adding non-root user and setting permissions..." && \
    useradd -u 1000 -m myuser && \
    mkdir -p /var/www/html/websiteMaker && \
    chown -R myuser:myuser /var/www/html/websiteMaker && \
    chmod -R 777 /var/www/html

# Enable Apache mod_rewrite
RUN echo "Enabling Apache mod_rewrite..." && \
    a2enmod rewrite

# Switch to non-root user
#USER myuser

# Set working directory
WORKDIR /var/www/html/websiteMaker


