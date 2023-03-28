#!/bin/sh

NAMESPACE="logging"

helm uninstall vector -n ${NAMESPACE}
helm install vector ./vector-agent-helm-chart -n ${NAMESPACE}
sudo kubectl get po -n ${NAMESPACE} | grep vector-daemonset
