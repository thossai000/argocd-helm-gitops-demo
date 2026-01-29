#!/usr/bin/env bash
set -euo pipefail

echo "Installing k3d..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo "Installing Argo CD CLI..."
sudo curl -sSL -o /usr/local/bin/argocd \
  https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

echo "Creating k3d cluster (K3s in Docker)..."
k3d cluster create gitops --agents 1 --wait

echo "Cluster created. Nodes:"
kubectl get nodes -o wide
