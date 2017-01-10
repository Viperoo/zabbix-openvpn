#!/bin/bash

path=/var/log/openvpn-status.log # path to openvpn status log

users=`sudo sed '/ROUTING TABLE/,$d' $path| sed 's/,.*//'| sed 1,3d` # array of certificate name

echo "{"
echo "\"data\":["

comma=""
for user in $users
do
    echo "    $comma{\"{#VPNUSER}\":\"$user\"}"
    comma=","
done

echo "]"
echo "}"
