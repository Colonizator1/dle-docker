# DataLife Engine Nginx+PHP-fpm + Docker

It's docker for old legacy project with CMS DataLife Engine v.13.2 with php 5.6, 7.2, 7.4 on your choice

## Step by step after git clone

1) cp .env.example .env and fill your envs
2) touch log/phpslow.log
3) cp etc/php/ssmtp.conf.example etc/php/ssmtp.conf and setup your credentials

## Installing DB

1) Enter db container ```docker exec -it db bash```
2) ```mysql -u root -p"password"```
3) ```create database exampledb character set utf8 collate utf8_bin;```
4) ```grant all privileges on exampledb.* to exampleuser@'%' identified by 'exampleuser_password';```

For restoring db:

1) paste your dump.sql into db/data/backup folder: ```mkdir db/data/backup && cp dump.sql db/data/backup/```
2) Enter db container ```docker exec -it db bash```
3) ```mysql -u exampleuser -p"exampleuser_password"```
4) ```use exampledb```
5) ```source /var/lib/mysql/backup/dump.sql```

## Nginx

1) Make copy from etc/nginx/conf.d/example.conf (name should be like *.conf) and change server_name for your domain name.
2) restart nginx: ```docker exec -it nginx nginx -s reload```

## Install DLE

1) Copy paste dle files into app folder
2) Rename db connection localhost to "db" (name of your docker service) in the app/engine/data/dbconfig.php
