
#!/bin/bash

# Install Kubernetes prerequisites
apt-get update && apt-get install -y apt-transport-https ca-certificates curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'deb https://apt.kubernetes.io/ kubernetes-focal main' > /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y kubelet kubeadm kubectl

# Join the cluster
$(ssh -o StrictHostKeyChecking=no root@${module.control_plane.control_plane_ip} kubeadm token create --print-join-command)
