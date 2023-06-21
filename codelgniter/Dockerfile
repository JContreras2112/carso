FROM php:8.1-apache

#Se instala dependencias de PHP
RUN apk update && apk add --no-cache libzip-dev zip && docker-php-ext-install zip

# Configurar el DocumentRoot de Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Habilitar el mod_rewrite de Apache
RUN a2enmod rewrite

#Carpeta raiz /public
WORKDIR /var/www/html

#Se instala para descargar composer
RUN apk --no-cache add curl
#Se instala composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#Instalación php codelgniter
RUN composer create-project codeigniter4/appstarter project-root

#Conexión a la base de datos. RUN docker-php-ext-install -j$(nproc) pdo && \  docker-php-ext-install -j$(nproc) pdo_mysql

COPY . .

#Permiso carpeta raiz
RUN chown -R www-data:www-data /var/www/html 

#Permiso carpeta writable(log)
#RUN chown -R www-data:www-data /var/www/html/app/writable

#Exponse puerto 80
EXPOSE 80