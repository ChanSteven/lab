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

# command not found: 'wkhtmltopdf'
RUN apt-get install curl wget -y
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev gdebi xfonts-75dpi
RUN curl -o wkhtmltox-0.12.2.1_linux-trusty-amd64.deb -SL https://3d38f849ea6eaa910a4aaf515d330bd56e5eeca2.googledrive.com/host/0B73yFF5VP2GQTzZBYi11QW5YQUE/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
RUN dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN pip install pip-accel

# ParseError: "decoder jpeg not available"
RUN apt-get install libjpeg-dev -y
RUN pip-accel install --no-cache-dir -I pillow

COPY ./requirements.txt /
RUN pip-accel install -r /requirements.txt
RUN pip-accel install pyinotify # for odoo8

COPY ./preinstall-custom.sh /
RUN sh /preinstall-custom.sh

COPY ./requirements-custom.txt /
RUN pip-accel install -r /requirements-custom.txt

VOLUME ["${ODOO_HOME}", "${ODOO_DATA}", "${ODOO_ADDONS}"]

COPY ./openerp-server.conf /etc/odoo/
COPY ./scripts/* /

EXPOSE 8069 8071

CMD ["/entrypoint.sh"]
