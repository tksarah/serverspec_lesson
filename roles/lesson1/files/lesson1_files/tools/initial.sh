#!/bin/bash

INVENTORY=$HOME/lesson1_files/tools/hosts
PLAYBOOK=$HOME/lesson1_files/tools/playbook.yml

PORT=$1

echo "Initializing ... $USER $PORT"
ansible-playbook -i $INVENTORY -t bootup -e "user=$USER cport=$PORT" $PLAYBOOK $2
CPORT=`/bin/docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' ${USER}_l1_target | gawk '{ print $3 }'`
CIP=`/bin/docker inspect --format '{{.NetworkSettings.IPAddress}}' "${USER}_l1_target"`
echo "Target Container IP Address : $CIP"
echo "Target Container PORT : $CPORT"
