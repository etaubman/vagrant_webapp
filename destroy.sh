cd ./loadbalancer
vagrant destroy -f
cd ..

cd ./webservers
vagrant destroy -f
cd ..

cd ./contentserver
vagrant destroy -f
cd ..

cd ./appserver
#vagrant destroy -f
cd ..

cd ./mysqlserver
vagrant destroy -f
cd ..