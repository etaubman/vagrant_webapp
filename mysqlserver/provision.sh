# Download and Install the Latest Updates for the OS
apt-get -y update

# Set the Server Timezone to EST
echo "America/New_York" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

apt-get -y install vim


sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin_password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin_password'
sudo apt-get -y install mysql-server

rm /etc/mysql/my.cnf
cp /vagrant_synced/my.cnf /etc/mysql/my.cnf

service mysql start

mysql -uroot -padmin_password -e "CREATE USER 'remote_user'@'%' IDENTIFIED BY 'remote_password';"
mysql -uroot -padmin_password -e "GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;"
mysql -uroot -padmin_password -e "FLUSH PRIVILEGES;"