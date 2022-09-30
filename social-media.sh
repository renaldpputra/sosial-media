#!/bin/bash
sudo apt-get update;
sudo apt-get install -y apache2 php php-mysql;
sudo apt-get install -y mysql-server;
sudo systemctl restart apache2;
sudo git clone https://github.com/sdcilsy/sosial-media.git;
sudo rm -rf /var/www/html/*
sudo mv sosial-media/* /var/www/html/
sudo mysql -u root -e "create database dbsosmed";
sudo mysql -u root dbsosmed < /var/www/html/dump.sql;
sudo mysql -u root -e "create user 'devopscilsy'@'localhost' identified by '1234567890'";
sudo mysql -u root -e "grant all privileges on *.* to 'devopscilsy'@'localhost'";
sudo systemctl restart apache2;
