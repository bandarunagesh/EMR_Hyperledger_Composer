#!/bin/bash
#
#

$PWD/fabric-dev-servers/startFabric.sh
cd $PWD/emr
composer network install --card PeerAdmin@hlfv1 --archiveFile emr@0.0.1.bna
composer network start --networkName emr --networkVersion 0.0.1 --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file networkadmin.card
composer network ping --card admin@emr
composer-rest-server -c admin@emr -n never -w true > composer-rest-server.out 2> composer-rest-server.err < /dev/null &