cd ./loadbalancer
vagrant up
cd ..

cd ./webservers
vagrant up
cd ..

cd ./contentserver
vagrant up
cd ..

cd ./appserver
#vagrant up
cd ..

cd ./mysqlserver
vagrant up
cd ..