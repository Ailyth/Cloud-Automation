#!/bin/bash
ip=$(ip a s eth1 | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2)
etc_entry="${ip} k8scpdm"
sudo sed -i '/^127\.0\.1\.1*/i '"$etc_entry"'' /etc/hosts
sudo sed -i '/^127\.0\.1\.1*/i '"$etc_entry"'' /etc/cloud/templates/hosts.debian.tmpl
