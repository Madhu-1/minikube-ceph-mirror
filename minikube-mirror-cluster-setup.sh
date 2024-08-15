#!/bin/bash

if [[ $1 == "destroy" ]]
then
	PROFILE=minicluster1 /root/workspace/minikube-ceph-mirror/rtalur-minikube-cluster.sh destroy
	PROFILE=minicluster2 /root/workspace/minikube-ceph-mirror/rtalur-minikube-cluster.sh destroy
	exit 0
fi

if [[ $1 == "mirror" ]]
then
	PRIMARY_CLUSTER=minicluster1 SECONDARY_CLUSTER=minicluster2 /root/workspace/minikube-ceph-mirror/rtalur-minikube-enable-mirroring.sh
	PRIMARY_CLUSTER=minicluster2 SECONDARY_CLUSTER=minicluster1 /root/workspace/minikube-ceph-mirror/rtalur-minikube-enable-mirroring.sh
	exit 0
fi
PROFILE=minicluster1 /root/workspace/minikube-ceph-mirror/rtalur-minikube-cluster.sh
PROFILE=minicluster2 /root/workspace/minikube-ceph-mirror/rtalur-minikube-cluster.sh
