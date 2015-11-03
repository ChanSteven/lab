FROM ubuntu:14.04

ENV ODOO_USER="odoo"
ENV ODOO_HOME="/opt/$ODOO_USER"
ENV ODOO_DATA="/var/lib/odoo"
ENV ODOO_ADDONS="/mnt/extra-addons"

#RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/*
#RUN apt-get clean
#RUN apt-get upgrade

RUN apt-get update && apt-get install -y --no-install-recommends \
    python-dev \
    python-pip \
    node-less \
    node-clean-css \
    libxml2-dev libxslt1-dev build-essential libpq-dev libldap2-dev libsasl2-dev libssl-dev
RUN pip install pip-accel

COPY ./requirements.txt /
RUN pip-accel install -r /requirements.txt
RUN pip-accel install pyinotify # for odoo8

VOLUME ["${ODOO_HOME}", "${ODOO_DATA}", "${ODOO_ADDONS}"]

COPY ./openerp-server.conf /etc/odoo/
COPY ./scripts/* /

EXPOSE 8069 8071

CMD ["/entrypoint.sh"]
