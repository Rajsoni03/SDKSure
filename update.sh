#!/bin/bash

# update source code
git pull

# build and update docker container
docker-compose build
if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

datetimeflag=$(date "+%b_%d_%Y_%H_%M_%S")

# Save log files
docker logs sdk-sure-django-backend > ./data/docker_logs/sdk-sure-django-backend-$datetimeflag.log 2>&1
docker logs sdk-sure-react-frontend > ./data/docker_logs/sdk-sure-react-frontend-$datetimeflag.log 2>&1
docker logs sdk-sure-postgres-db > ./data/docker_logs/sdk-sure-postgres-db-$datetimeflag.log 2>&1
docker logs sdk-sure-nginx-server > ./data/docker_logs/sdk-sure-nginx-server-$datetimeflag.log 2>&1

# Stop old containers
docker stop sdk-sure-django-backend
docker stop sdk-sure-react-frontend
docker stop sdk-sure-nginx-server
docker stop sdk-sure-postgres-db

# again check and shutdown the container 
docker-compose down

# Launch new container
docker-compose up -d

# add ssh certificates for LDAP
# docker exec sdk-sure-django-backend cp /app/backend/config/tls-ca-intermediate.crt /usr/local/share/ca-certificates/tls-ca-intermediate.crt
# docker exec sdk-sure-django-backend cp /app/backend/config/tls-ca-root.crt /usr/local/share/ca-certificates/tls-ca-root.crt
# docker exec sdk-sure-django-backend chmod 644 /usr/local/share/ca-certificates/tls-ca-intermediate.crt
# docker exec sdk-sure-django-backend chmod 644 /usr/local/share/ca-certificates/tls-ca-root.crt
# docker exec sdk-sure-django-backend update-ca-certificates