#Ejecutar comando para levantar el contenedor
docker compose up -d --build

# Eliminar el contenido del directorio existente
rm -rf /var/www/html/project-root/*

# Ejecutar el comando para crear el proyecto
docker compose exec web composer create-project codeigniter4/appstarter project-root