#!/bin/bash
sudo adduser --system --quiet --shell=/bin/bash --home=$ODOO_HOME --gecos 'ODOO' --group $ODOO_USER
chown -R $ODOO_USER:$ODOO_USER $ODOO_HOME
