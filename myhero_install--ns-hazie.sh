#! /bin/bash

kubectl create namespace hazie

echo "Installing the MyHero Sample Application"
kubectl apply -f myhero_data.yaml --namespace hazie
kubectl apply -f myhero_mosca.yaml --namespace hazie
kubectl apply -f myhero_ernst.yaml --namespace hazie
kubectl apply -f myhero_app.yaml --namespace hazie

MYHERO_APP_EXTERNAL_IP=$(kubectl get services myhero-app --namespace hazie -o json | python -c 'import sys, json; print json.load(sys.stdin)["status"]["loadBalance
r"]["ingress"][0]["ip"]')
echo "AP IP: ${MYHERO_APP_EXTERNAL_IP}"
sed "s/<PROVIDE-EXTERNAL-IP-FOR-myhero-app>/${MYHERO_APP_EXTERNAL_IP}/" myhero_ui.yaml > myhero_ui_ready--ns-hazie.yaml

kubectl apply -f myhero_ui_ready--ns-hazie.yaml --namespace hazie
