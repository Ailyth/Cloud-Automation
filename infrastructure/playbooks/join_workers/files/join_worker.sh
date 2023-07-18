#!/bin/bash

kubeadm_token=$(sudo kubeadm token create)
discovery_token=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | awk '{print $2}')

kubeadm_command="sudo kubeadm join --token ${kubeadm_token} k8scpdm:6443 --discovery-token-ca-cert-hash sha256:${discovery_token}"
echo ${kubeadm_command} >> join_workers_kubeadm_command.sh
