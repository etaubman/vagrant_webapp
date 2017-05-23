#! /usr/bin/env bash


#
# Provision script for Ubuntu 14.04 LTS
# ------------
#


echo -e "\n\n--- Updating packages list ---\n"
sudo apt-get -qq update


echo -e "\n--- Installing Apache2 ---\n"
sudo apt-get -y install apache2 > /dev/null 2>&1



echo -e "\n--- Installing PHP5 ---\n"
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get -y update
sudo apt-get -y install php
sudo apt-get -y install php-mcrypt php-mysql php-xml php-intl php-intl php-apcu php-uuid php-cgi php-cli php-gd php-ldap php-sqlite3 php-uploadprogress
sudo apt-get -y install libapache2-mod-php7.0
sudo apt-get -y install php-mbstring


echo -e "\n--- Installing Git ---\n"
sudo apt-get -y install git > /dev/null 2>&1


echo -e "\n--- Updating packages list ---\n"
sudo apt-get -qq update


echo -e "\n--- Enabling mod-rewrite ---\n"
a2enmod rewrite > /dev/null 2>&1


echo -e "\n--- Setting up our DirectoryIndex specification ---\n"
cat > /etc/apache2/mods-enabled/dir.conf <<EOF
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOF


echo -e "\n--- Restarting Apache ---\n"
sudo service apache2 restart > /dev/null 2>&1


echo -e "\n--- Installing Composer ---\n"
curl --silent https://getcomposer.org/installer | php > /dev/null 2>&1
sudo mv composer.phar /usr/local/bin/composer



echo -e "\n--- Adding new bash commands ---\n"
cat >> ~/.bashrc <<EOF
alias cls='clear'
EOF



rm -rf /var/www
ln -s /vagrant_synced/src/www /var


sed -i '12s/.*/DocumentRoot \/var\/www\/public/' /etc/apache2/sites-enabled/000-default.conf
sed -i '166s/.*/AllowOverride All/' /etc/apache2/apache2.conf
ln -s /vagrant_synced/src/www/app/webapp/public /var/www
service apache2 restart


echo -e "\n--- Installation done ! ---\n"