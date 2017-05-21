cd ./loadbalancer
vagrant down
cd ..

cd ./webservers
vagrant down
cd ..

cd ./contentserver
vagrant down
cd ..

cd ./appserver
#vagrant down
cd ..

cd ./mysqlserver
vagrant down
cd ..