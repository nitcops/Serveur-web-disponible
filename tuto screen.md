
vim deploy.sh

<img width="894" height="494" alt="image" src="https://github.com/user-attachments/assets/a27e6988-3896-4bf7-8c85-04d13df5616f" />

chmod +x deploy.sh

./deploy.sh

la conf de mon nginx hôte dans vim /etc/nginx/sites-available/default

<img width="697" height="336" alt="image" src="https://github.com/user-attachments/assets/b8f858be-bab8-4c86-9ced-6edacd7626ff" />

ici on à accès au site web on peut voir que l'ont à était redirigé vers le conteneur B soit 172.18.0.3 l'erreur de synthaxe est du au caractére spéciaux

<img width="624" height="133" alt="image" src="https://github.com/user-attachments/assets/51168fc6-36c6-4f3c-8d64-eb574005ba72" />

###générons un certificat ssl : 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  
###(les question sont facultative vous pouvez appuyé sur entrée à toute les question) 

on retourne sur vim /etc/nginx/sites-available/default pour rajouter le certificat ssl à la redirection http vers https

<img width="867" height="495" alt="image" src="https://github.com/user-attachments/assets/24950c26-c7d1-44fa-8032-219b3226babd" />

nous somme donc sur le site A qui comme vous le voyé est maitenant en https/ssl

<img width="476" height="108" alt="image" src="https://github.com/user-attachments/assets/d6c05c95-7fa8-457b-9dd8-a91756790dae" />

je stop le site A avec docker stop web1

<img width="894" height="288" alt="image" src="https://github.com/user-attachments/assets/79bdc19c-9144-4eb1-8401-27b6cf28cd8c" />

et le load balanceur switch de site automatiquement vers le site B, le site est donc toujours disponible grâce au nginx qui fait load balancing

<img width="464" height="109" alt="image" src="https://github.com/user-attachments/assets/544c0b7c-1ad7-4275-ba7e-9e55f15fe082" />



