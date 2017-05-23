#Update the machine
apt-get -y update

cd /etc/ssl
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
openssl rsa -passin pass:x -in server.pass.key -out server.key
rm server.pass.key
openssl req -new -key server.key -out server.csr \
  -subj "/C=US/ST=New York/L=New York/O=Rochester Computer Consulting Company/OU=Product Development/CN=Dev Environment"
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

cat server.crt server.key > server.pem

apt-get -y install haproxy
sed -i '2s/.*/ENABLED=1/' /etc/default/haproxy
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy-original.cfg
cp /vagrant_synced/haproxy.cfg /etc/haproxy/haproxy.cfg

service haproxy restart
