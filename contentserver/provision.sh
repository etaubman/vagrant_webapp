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
sudo apt-get -y install php5 libapache2-mod-php5 > /dev/null 2>&1


echo -e "\n--- Updating packages list ---\n"
sudo apt-get -qq update


echo -e "\n--- Enabling mod-rewrite ---\n"
a2enmod rewrite > /dev/null 2>&1


echo -e "\n--- Setting up our DirectoryIndex specification ---\n"
cat > /etc/apache2/mods-enabled/dir.conf <<EOF
<IfModule mod_dir.c>
    DirectoryIndex index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOF


echo -e "\n--- Restarting Apache ---\n"
sudo service apache2 restart > /dev/null 2>&1




echo -e "\n--- Adding new bash commands ---\n"
cat >> ~/.bashrc <<EOF
alias cls='clear'
EOF



rm -rf /var/www
ln -s /vagrant_synced/src/www /var


echo -e "\n--- Installation done ! ---\n"