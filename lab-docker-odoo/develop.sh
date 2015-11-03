cd source
ODOO_VERSION=$(git rev-parse --abbrev-ref HEAD)
cd ..

IMAGE_NAME=lab-docker-odoo-$ODOO_VERSION
CONTAINER_NAME=$IMAGE_NAME-container
DB_NAME=$IMAGE_NAME-db

docker rm -f $DB_NAME
docker run -d -v $PWD/DATA:/var/lib/postgresql/data -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name $DB_NAME postgres

cmd=/entrypoint.sh
#cmd=/entrypoint-debug.sh

cp ./source/requirements.txt .
#docker rmi $IMAGE_NAME
docker build -t $IMAGE_NAME .
docker run --rm --name $CONTAINER_NAME \
           -v $PWD/source:/opt/odoo \
           -v $PWD/ODOO:/var/lib/odoo \
           --link $DB_NAME:db \
           -p 8069:8069 \
           -i -t $IMAGE_NAME $cmd
