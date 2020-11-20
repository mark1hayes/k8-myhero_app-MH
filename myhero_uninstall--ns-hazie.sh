#! /bin/bash

echo "Uninstalling the MyHero Demo Application"
kubectl delete service myhero-ui -n hazie
kubectl delete service myhero-app -n hazie
kubectl delete service myhero-data -n hazie
kubectl delete service myhero-mosca -n hazie

kubectl delete deployment myhero-ui -n hazie
kubectl delete deployment myhero-app -n hazie
kubectl delete deployment myhero-ernst -n hazie
kubectl delete deployment myhero-mosca -n hazie
kubectl delete deployment myhero-data -n hazie
