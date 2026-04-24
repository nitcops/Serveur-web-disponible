# Déploiement d'une architecture Web résiliente par conteneurisation et équilibrage de charge.

Petit projet ou je montre comment rendre des serveur web hautement disponible, sécurisé et standardisé (agile)

On utilise cette architecture pour trois raisons majeures :

    La Sécurité (Le Reverse Proxy) : Nginx sert de "bouclier". C'est lui qui gère le SSL (HTTPS) et qui filtre les requêtes avant de les envoyer aux conteneurs. Si un conteneur plante, ton entrée reste propre.

    La Disponibilité (Le Load Balancing) : Si tu dois mettre à jour ton site, tu peux couper le Conteneur_A, le mettre à jour, pendant que le Conteneur_B continue de répondre aux utilisateurs. Zéro interruption de service.

    L'Agilité (Docker) : Demain, si ton patron veut passer d'un Wiki à un autre outil, tu as juste à changer l'image Docker. Tu ne casses pas tout ton serveur Linux.
