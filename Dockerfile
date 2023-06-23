#imagen de apache con version de php 8.1
FROM php:8.1-apache

#Se instala dependencias de PHP
RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get install -y libzip-dev zip libicu-dev && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*
#Install PHP extensions
RUN docker-php-ext-install zip intl mysqli
#Configurar el DocumentRoot de Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/project-root/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
#Habilitar el mod_rewrite de Apache
RUN a2enmod rewrite
#Carpeta raiz /public
WORKDIR /var/www/html
#Se instala composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#Conexión a la base de datos. RUN docker-php-ext-install -j$(nproc) pdo && \  docker-php-ext-install -j$(nproc) pdo_mysql
COPY . .
#Copiar el archivo .sh al contenedor
COPY ./codeigniter.sh /codeigniter.sh
#Otorgar permisos de ejecución al archivo .sh
RUN chmod a+x /codeigniter.sh
#RUN /codeigniter.sh
#Permiso carpeta raiz#Permiso carpeta writable(log)
RUN chown -R www-data:www-data /var/www/html 
#Ejecutar el archivo .sh al iniciar el contenedor, omitir porque no lo ejecuta
#clearCMD ["/codeigniter.sh"]
#Exponse puerto 80
EXPOSE 80