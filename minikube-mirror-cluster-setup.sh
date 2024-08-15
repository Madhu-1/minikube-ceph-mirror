#!/bin/bash

if [[ $1 == "destroy" ]]
then
	PROFILE=minicluster1 ./minikube-cluster.sh destroy
	PROFILE=minicluster2 ./minikube-cluster.sh destroy
	exit 0
fi

if [[ $1 == "mirror" ]]
then
	PRIMARY_CLUSTER=minicluster1 SECONDARY_CLUSTER=minicluster2 ./minikube-enable-mirroring.sh
	PRIMARY_CLUSTER=minicluster2 SECONDARY_CLUSTER=minicluster1 ./minikube-enable-mirroring.sh
	exit 0
fi
PROFILE=minicluster1 ./minikube-cluster.sh
PROFILE=minicluster2 ./minikube-cluster.sh
