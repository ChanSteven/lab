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

RUN apt-get install curl -y \
    && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
    && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
    && dpkg --force-depends -i wkhtmltox.deb \
    && apt-get -y install -f --no-install-recommends

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
