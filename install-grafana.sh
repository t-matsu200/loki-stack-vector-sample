#!/bin/sh

NAMESPACE="logging"

helm uninstall grafana -n ${NAMESPACE}
helm install grafana grafana/grafana -f grafana/values.yaml -n ${NAMESPACE}
sudo kubectl get po -n ${NAMESPACE}
sudo kubectl get secret grafana -o jsonpath="{.data.admin-password}" -n ${NAMESPACE} | base64 --decode
