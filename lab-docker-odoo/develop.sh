docker rm -f lab-docker-odoo-db
docker run -d -v $PWD/DATA:/var/lib/postgresql/data -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name lab-docker-odoo-db postgres

cp ./source/requirements.txt .
#docker rmi lab-docker-odoo
docker build -t lab-docker-odoo .
docker run --rm --name container-lab-docker-odoo \
           -v $PWD/source:/opt/odoo \
           -v $PWD/ODOO:/var/lib/odoo \
           --link lab-docker-odoo-db:db \
           -p 8069:8069 \
           -i -t lab-docker-odoo /entrypoint-debug.sh
