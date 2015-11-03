#!/bin/bash

set -e

# set odoo database host, port, user and password
touch run-odoo.sh
echo PGHOST=$DB_PORT_5432_TCP_ADDR            >> run-odoo.sh
echo PGPORT=$DB_PORT_5432_TCP_PORT            >> run-odoo.sh
echo PGUSER=$DB_ENV_POSTGRES_USER             >> run-odoo.sh
echo PGPASSWORD=$DB_ENV_POSTGRES_PASSWORD     >> run-odoo.sh
echo "export PGHOST PGPORT PGUSER PGPASSWORD" >> run-odoo.sh
echo "/opt/odoo/odoo.py -c /etc/odoo/openerp-server.conf" >> run-odoo.sh

adduser --system --quiet --shell=/bin/bash --home=$ODOO_HOME --gecos 'ODOO' --group $ODOO_USER
chown -R $ODOO_USER:$ODOO_USER $ODOO_HOME
chown -R $ODOO_USER:$ODOO_USER $ODOO_DATA
chown -R $ODOO_USER:$ODOO_USER $ODOO_ADDONS
chown -R $ODOO_USER:$ODOO_USER /etc/odoo
