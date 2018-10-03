echo Give me the adress of ssh server
read ADDR="root@localhost"
read -p	"Do you want copy certs of current user? (else from .ssh/ in this dir) [y/N]" yn
case $yn in
    [Yy]* ) cat ~/.ssh/id_rsa.pub | ssh $ADDR 'mkdir -p ~/.ssh; cat >> .ssh/authorized_keys';;
    [Ny]* ) cat .ssh/id_rsa.pub | ssh $ADDR 'mkdir -p ~/.ssh; cat >> .ssh/authorized_keys';;
	* ) cat .ssh/id_rsa.pub | ssh $ADDR 'mkdir -p ~/.ssh; cat >> .ssh/authorized_keys';;
esac

