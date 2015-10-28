FROM ubuntu:14.04

ENV ODOO_USER="odoo"
ENV ODOO_HOME="/opt/$ODOO_USER"

VOLUME ${ODOO_HOME}

COPY ./scripts/* /

CMD ["/entrypoint.sh"]
