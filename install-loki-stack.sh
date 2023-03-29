#!/bin/sh

NAMESPACE="logging"

helm uninstall loki-stack -n ${NAMESPACE}
helm install loki-stack grafana/loki-stack -f loki-helm-chart/values.yaml -n ${NAMESPACE}
sleep 10
sudo kubectl get po -n ${NAMESPACE}
sudo kubectl get secret loki-stack-grafana -o jsonpath="{.data.admin-password}" -n ${NAMESPACE} | base64 --decode
