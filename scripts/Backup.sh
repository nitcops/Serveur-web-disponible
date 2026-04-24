### Scripts de sauvegarde

#!/bin/bash
DEST="/backup/$(date +%Y-%m-%d)"
mkdir -p $DEST
cp /etc/nginx/sites-available/default $DEST/nginx_conf.bak
# Optionnel: sauvegarder les fichiers web si tu en as
tar -czf $DEST/web_files.tar.gz /var/lib/docker/volumes/ 2>/dev/null
echo "Sauvegarde terminée dans $DEST"
