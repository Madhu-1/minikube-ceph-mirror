#!/bin/bash

PROFILE="${PROFILE:-minicluster1}"
echo PROFILE is $PROFILE

if [[ $1 == "destroy" ]]
then
	minikube --profile="${PROFILE}" delete
	sudo rm -f /var/lib/libvirt/images/minikube-box2-vm-disk-"${PROFILE}"-50G
        exit 0
fi

minikube start --force -b kubeadm --driver=kvm2 --network=vagrant-libvirt --kubernetes-version="v1.27.0" --profile="${PROFILE}" --feature-gates="ReadWriteOncePod=true,AnyVolumeDataSource=true,CrossNamespaceVolumeDataSource=true"  --extra-disks=3 --disk-size=30g

minikube ssh "sudo mkdir -p /mnt/vda1/var/lib/rook" --profile="${PROFILE}"
minikube ssh "sudo ln -s /mnt/vda1/var/lib/rook /var/lib/rook" --profile="${PROFILE}"

kubectl create -f ./rook/rook/deploy/examples/common.yaml --context=${PROFILE}
kubectl create -f ./rook/rook/deploy/examples/crds.yaml --context=${PROFILE}
kubectl create -f ./rook/rook/deploy/examples/operator.yaml --context=${PROFILE}
kubectl create -f https://raw.githubusercontent.com/csi-addons/kubernetes-csi-addons/main/deploy/controller/setup-controller.yaml --context=${PROFILE}
kubectl create -f https://raw.githubusercontent.com/csi-addons/kubernetes-csi-addons/main/deploy/controller/crds.yaml --context=${PROFILE}
kubectl create -f https://raw.githubusercontent.com/csi-addons/kubernetes-csi-addons/main/deploy/controller/rbac.yaml --context=${PROFILE}

cat <<EOF | kubectl --context=${PROFILE} apply -f -
kind: ConfigMap
apiVersion: v1
metadata:
  name: rook-config-override
  namespace: rook-ceph
data:
  config: |
    [global]
    osd_pool_default_size = 1
    mon_warn_on_pool_no_redundancy = false
---
apiVersion: ceph.rook.io/v1
kind: CephCluster
metadata:
  name: my-cluster
  namespace: rook-ceph
spec:
  dataDirHostPath: /var/lib/rook
  cephVersion:
    image: quay.ceph.io/ceph-ci/ceph:wip-pkalever-rbd-group-snap-mirror
    allowUnsupported: true
  mon:
    count: 1
    allowMultiplePerNode: true
  dashboard:
    enabled: false
  crashCollector:
    disable: true
  storage:
    useAllNodes: true
    useAllDevices: true
  network:
    provider: host
  healthCheck:
    daemonHealth:
      mon:
        interval: 45s
        timeout: 600s
EOF
kubectl create -f ./rook/rook/deploy/examples/toolbox.yaml --context=${PROFILE}
#kubectl --context=${PROFILE} set image deployment/rook-ceph-operator *=madhupr001/rook -nrook-ceph 
cat <<EOF | kubectl --context=${PROFILE} apply -f -
apiVersion: ceph.rook.io/v1
kind: CephBlockPool
metadata:
  name: replicapool
  namespace: rook-ceph
spec:
  replicated:
    size: 1
  mirroring:
    enabled: true
    mode: image
    # schedule(s) of snapshot
    #snapshotSchedules:
      #- interval: 1h # daily snapshots
        # startTime: 14:00:00-05:00
EOF
