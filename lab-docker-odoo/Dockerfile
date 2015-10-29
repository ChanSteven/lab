FROM ubuntu:14.04

ENV ODOO_USER="odoo"
ENV ODOO_HOME="/opt/$ODOO_USER"

RUN apt-get update && apt-get install -y --no-install-recommends \
    python-dev \
    python-pip \
    node-less \
    node-clean-css

RUN apt-get install libxml2-dev libxslt1-dev build-essential libpq-dev libldap2-dev libsasl2-dev libssl-dev -y
RUN pip install pip-accel

COPY ./requirements.txt /
RUN pip-accel install -r /requirements.txt

VOLUME ${ODOO_HOME}

COPY ./scripts/* /

EXPOSE 8069 8071

CMD ["/entrypoint.sh"]
