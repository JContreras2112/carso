#Elimina la cache de docker
#$ docker system prune
#Bajar contenedor
#$docker compose down

#Permiso al .sh fuera del contenedor
#$ chmod 744 codeigniter.sh
#Ejecutar .sh fuera del contenedor
#juana.contreras@vm-vbdocker [2023-06-21 19:52:58]: ~/winshare/codelgniter
#$ ./codeigniter.sh

#Ejecutar comando para levantar el contenedor
docker compose up -d --build

#Eliminar el contenido del directorio existente para un proyecto nuevo
#Nota: para crear un nuevo proyecto en carpeta existente se debe eliminar el .gitignore
docker compose exec web rm -rf /var/www/html/project-root/*
docker compose exec web rm -rf /var/www/html/project-root/.gitignore
   

#Ejecutar el comando para crear el proyecto
docker compose exec web composer create-project codeigniter4/appstarter project-root

#Dar permiso a la carpeta de proyecto ddentro del contenedor
docker compose exec web chown -R www-data:www-data /var/www/html

#permisos carpeta local
docker compose exec web chown -R www-data:www-data /winshare/codeigniter/project-root