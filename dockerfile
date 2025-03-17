# Use official PHP with Apache
FROM php:8-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory inside the container
WORKDIR /var/www/html

# Copy project files to the container
COPY . /var/www/html

# Expose Apache Port
EXPOSE 80
