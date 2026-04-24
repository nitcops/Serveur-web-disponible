### Scripts de sauvegarde

#!/bin/bash
DEST="/backup/$(date +%Y-%m-%d)"
mkdir -p $DEST
cp /etc/nginx/sites-available/default $DEST/nginx_conf.bak
echo "Sauvegarde terminée dans $DEST"
