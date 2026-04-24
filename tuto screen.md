
vim deploy.sh

<img width="894" height="494" alt="image" src="https://github.com/user-attachments/assets/a27e6988-3896-4bf7-8c85-04d13df5616f" />

chmod +x deploy.sh

./deploy.sh

Bonne pratique : En environnement de production, il est recommandé de ne pas modifier le fichier default. La norme est de créer un fichier de configuration dédié dans /etc/nginx/sites-available/, puis de l'activer via un lien symbolique dans /etc/nginx/sites-enabled/. Cela permet de gérer proprement plusieurs domaines via le DNS ou le fichier /etc/hosts.

Pour ce projet : Afin de simplifier la mise en place et d'éviter la manipulation de liens symboliques ou la configuration DNS, nous modifierons directement le fichier /etc/nginx/sites-available/default. C'est une méthode rapide et efficace pour une preuve de concept (POC).

<img width="697" height="336" alt="image" src="https://github.com/user-attachments/assets/b8f858be-bab8-4c86-9ced-6edacd7626ff" />

Une fois la configuration appliquée, nous avons accès au site web. Dans cet exemple, on constate que nous avons été redirigés vers le conteneur B (IP : 172.18.0.3).

    Note technique : Les erreurs d'affichage sur certains caractères (ex: nÂ°2) sont dues à un problème d'encodage (UTF-8) entre le terminal et le navigateur lors de la création de la page via la commande echo. Cela n'affecte en rien le fonctionnement de l'infrastructure de load balancing.
    
<img width="624" height="133" alt="image" src="https://github.com/user-attachments/assets/51168fc6-36c6-4f3c-8d64-eb574005ba72" />

Sécurisation de l'infrastructure (HTTPS)

Génération d'un certificat SSL auto-signé :
   
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  

Note : Les informations demandées lors de la génération sont facultatives pour un environnement de test ; vous pouvez appuyer sur Entrée pour toutes les questions afin de passer à l'étape suivante.

Configuration de Nginx :

Nous retournons dans le fichier /etc/nginx/sites-available/default afin d'intégrer le certificat et mettre en place la redirection automatique du flux HTTP vers le flux sécurisé HTTPS.

<img width="867" height="495" alt="image" src="https://github.com/user-attachments/assets/24950c26-c7d1-44fa-8032-219b3226babd" />

Nous sommes désormais connectés au Serveur A. Comme vous pouvez le constater, la connexion est maintenant sécurisée via le protocole HTTPS (SSL).

<img width="476" height="108" alt="image" src="https://github.com/user-attachments/assets/d6c05c95-7fa8-457b-9dd8-a91756790dae" />

Afin de vérifier la haute disponibilité de notre infrastructure, nous allons simuler une panne en arrêtant manuellement le premier serveur web :

docker stop web1

<img width="894" height="288" alt="image" src="https://github.com/user-attachments/assets/79bdc19c-9144-4eb1-8401-27b6cf28cd8c" />

Observation : En rafraîchissant la page dans le navigateur, on constate que le service reste accessible. Le Load Balancer Nginx détecte automatiquement que le conteneur A ne répond plus et redirige tout le trafic vers le conteneur B. C'est le principe de la haute disponibilité.

<img width="464" height="109" alt="image" src="https://github.com/user-attachments/assets/544c0b7c-1ad7-4275-ba7e-9e55f15fe082" />




