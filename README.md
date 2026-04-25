# Titre du Projet : Déploiement d'une architecture Web résiliente par conteneurisation et équilibrage de charge

# Description :

Réalisation d'une infrastructure permettant de rendre des serveurs web hautement disponibles, sécurisés et standardisés (approche agile).

Pourquoi cette architecture ? (3 piliers majeurs)

#  La Sécurité (Reverse Proxy) :
    
    Nginx sert de "bouclier". C'est lui qui gère le chiffrement SSL (HTTPS) et qui filtre les requêtes avant de les transmettre aux conteneurs. Si un conteneur est corrompu ou tombe en panne, le point d'entrée reste sécurisé et propre.

#    La Disponibilité (Load Balancing) :
    Mise en place d'une répartition de charge. En cas de maintenance ou de mise à jour, il est possible de couper le Conteneur A sans interrompre le service, car le Conteneur B continue de répondre aux utilisateurs. L'objectif est le zéro interruption de service.

#    L’Agilité (Docker) :
    Grâce à la conteneurisation, l'infrastructure est standardisée. Si le besoin métier évolue (par exemple, passer d'un Wiki à un outil de gestion de parc comme GLPI), il suffit de changer l'image Docker sans impacter la configuration du serveur hôte Linux.

Schéma de l’infrastructure

Voici l'organisation logique du projet :

    Nginx Load Balancer (Hôte) : Point d'entrée unique qui reçoit le trafic sécurisé (Port 443).

    Réseau Docker Isolé : Un réseau privé (projet-infra) permettant la communication interne entre les composants.

    2 Conteneurs Web (Nginx) : Serveurs applicatifs redondés qui traitent les requêtes.

Compétences 

    Système : Administration Linux (Debian/Ubuntu).

    Réseau : Reverse Proxy, Load Balancing (Round Robin), redirection HTTP vers HTTPS.

    Virtualisation : Docker (Images, Conteneurs, Réseaux).

    Sécurité : Gestion des certificats SSL/TLS.
