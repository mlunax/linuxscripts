echo Give me the adress of ssh server
read ADDR="root@localhost"
cat .ssh/id_rsa.pub | ssh $ADDR 'mkdir -p ~/.ssh; cat >> .ssh/authorized_keys'