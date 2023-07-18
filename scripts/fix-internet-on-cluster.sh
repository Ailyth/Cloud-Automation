#!/bin/bash
cd ../cni
kubectl delete -f calico.yaml
kubectl apply -f calico.yaml
kubectl set env daemonset/calico-node -n kube-system IP_AUTODETECTION_METHOD=interface=ens37
