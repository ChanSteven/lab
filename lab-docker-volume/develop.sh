docker rmi lab-docker-volume
docker build -t lab-docker-volume .
docker run --rm --name container-lab-docker-volume \
           -v $PWD/VOLUME:/opt/odoo \
           -i -t lab-docker-volume /entrypoint-debug.sh
