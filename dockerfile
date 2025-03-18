# Use the official PHP image with Apache
FROM php:8-apache

# Install dependencies for PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install PHPUnit manually
RUN curl -sS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit && chmod +x /usr/local/bin/phpunit

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the current directory contents to /var/www/html in the container
COPY . /var/www/html

# Expose port 80
EXPOSE 80
