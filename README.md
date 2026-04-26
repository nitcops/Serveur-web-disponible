# Titre du Projet : Architecture Web résiliente par conteneurisation et équilibrage de charge/reverse proxy

# Description :

Mise en place d'un Reverse Proxy Nginx configuré pour faire du Load Balancing. Cette architecture permet de sécuriser l'accès au service, mais aussi de garantir la disponibilité en répartissant la charge sur plusieurs conteneurs.

tuto MEP : https://github.com/nitcops/LoadBalancingNginx-DockerWeb/blob/main/tuto%20screen.md

Pourquoi cette architecture ? (3 piliers)

#  La Sécurité (Reverse Proxy) :
    
    Nginx sert de "bouclier". C'est lui qui gère le chiffrement SSL (HTTPS) et qui filtre les requêtes avant de les transmettre aux conteneurs. Si un conteneur est corrompu ou tombe en panne, le point d'entrée reste sécurisé et propre.

#    La Disponibilité (Load Balancing) :
    Mise en place d'une répartition de charge. En cas de maintenance ou de mise à jour, il est possible de couper le Conteneur A sans interrompre le service, car le Conteneur B continue de répondre aux utilisateurs. L'objectif est le zéro interruption de service.

#    L’Agilité (Docker) :
    Grâce à la conteneurisation, l'infrastructure est standardisée. Si le besoin métier évolue (par exemple, passer d'un Wiki à un outil de gestion de parc comme GLPI), il suffit de changer l'image Docker sans impacter la configuration du serveur hôte Linux.


Voici l'organisation logique du projet :

    Nginx Load Balancer (Hôte) : Point d'entrée unique qui reçoit le trafic sécurisé (Port 443).

    Réseau Docker Isolé : Un réseau privé (projet-infra) permettant la communication interne entre les composants.

    2 Conteneurs Web (Nginx) : Serveurs applicatifs redondés qui traitent les requêtes.

Compétences :

    Système : Administration Linux (Debian/Ubuntu).

    Réseau : Reverse Proxy, Load Balancing (Round Robin), redirection HTTP vers HTTPS.

    Virtualisation : Docker (Images, Conteneurs, Réseaux).

    Sécurité : Gestion des certificats SSL/TLS.
