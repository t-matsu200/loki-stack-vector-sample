#!/bin/sh

NAMESPACE="logging"

helm uninstall loki-distributed -n ${NAMESPACE}
helm install loki-distributed grafana/loki-distributed -f loki-distributed/values.yaml -n ${NAMESPACE}
sleep 10
sudo kubectl get po -n ${NAMESPACE}
