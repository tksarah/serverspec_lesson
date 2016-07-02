#!/bin/bash

case $1 in
        host)
                echo
                echo "Login Serverspec Host... "
                echo
		HOST=${USER}_l1_${1}
                docker exec -it $HOST bash
                echo ;;
        target)
                echo
                echo "Login Serverspec Target... "
                echo
		HOST="${USER}_l1_${1}"
                docker exec -it $HOST bash
                echo ;;
        *)
                echo
                echo "=== USAGE ==="
                echo
                echo "ex)"
                echo "    # ./login.sh [host|target|]"
                echo
                echo "Description"
                echo "      host      : login serverspec host"
                echo "      target    : login serverspec target"
                echo
esac
