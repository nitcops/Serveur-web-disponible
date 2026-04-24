#!/bin/bash

# 1. Mise à jour du système et installation des dépendances
apt update && apt upgrade -y
apt install -y docker.io nginx curl

# 2. Création du réseau et des conteneurs
docker network create projet-infra
docker run -d --name web1 --network projet-infra nginx
docker run -d --name web2 --network projet-infra nginx

# 3. Personnalisation des pages (pour le test visuel)
docker exec web1 bash -c "echo '<h1>Serveur n1 - Prod A</h1>' > /usr/share/nginx/html/index.html"
docker exec web2 bash -c "echo '<h1>Serveur n2 - Prod B</h1>' > /usr/share/nginx/html/index.html"

# 4. Récupération des adresses IP des conteneurs
IP1=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web1)
IP2=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web2)

echo "Installation terminée."
echo "IP Web1 : $IP1"
echo "IP Web2 : $IP2"
