docker rm -f lab-docker-odoo-db
docker run -d -v $PWD/DATA:/var/lib/postgresql/data -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name lab-docker-odoo-db postgres

docker rmi lab-docker-odoo
docker build -t lab-docker-odoo .
docker run --rm --name container-lab-docker-odoo \
           -v $PWD/source:/opt/odoo \
           --link lab-docker-odoo-db:db \
           -i -t lab-docker-odoo /entrypoint-debug.sh
