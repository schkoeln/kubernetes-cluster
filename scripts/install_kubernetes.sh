#!/bin/bash

# Install Kubernetes prerequisites
apt-get update && apt-get install -y apt-transport-https ca-certificates curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'deb https://apt.kubernetes.io/ kubernetes-focal main' > /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y kubelet kubeadm kubectl

# Initialize Kubernetes Control Plane
kubeadm init --pod-network-cidr=10.244.0.0/16

# Configure kubeconfig for root user
mkdir -p $HOME/.kube && cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config