#!/bin/bash

PRIMARY_CLUSTER="${PRIMARY_CLUSTER:-minicluster1}"
SECONDARY_CLUSTER="${SECONDARY_CLUSTER:-minicluster2}"


# patch rook configmap to override required configuration for DR

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_OMAP_GENERATOR", "value": "true" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_OMAP_GENERATOR", "value": "true" }]' --context="${SECONDARY_CLUSTER}"

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/ROOK_CSI_ALLOW_UNSUPPORTED_VERSION", "value": "true" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/ROOK_CSI_ALLOW_UNSUPPORTED_VERSION", "value": "true" }]' --context="${SECONDARY_CLUSTER}"

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_VOLUME_REPLICATION", "value": "true" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_VOLUME_REPLICATION", "value": "true" }]' --context="${SECONDARY_CLUSTER}"

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_CSIADDONS", "value": "true" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_ENABLE_CSIADDONS", "value": "true" }]' --context="${SECONDARY_CLUSTER}"


kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_VOLUME_REPLICATION_IMAGE", "value": "quay.io/csiaddons/volumereplication-operator:latest" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_VOLUME_REPLICATION_IMAGE", "value": "quay.io/csiaddons/volumereplication-operator:latest" }]' --context="${SECONDARY_CLUSTER}"

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_LOG_LEVEL", "value": "5" }]' --context="${PRIMARY_CLUSTER}"
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/CSI_LOG_LEVEL", "value": "5" }]' --context="${SECONDARY_CLUSTER}"

# Replace cephcsi image
kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/ROOK_CSI_CEPH_IMAGE", "value": "madhupr001/cephcsi:v2" }]' --context="${PRIMARY_CLUSTER}"

kubectl patch cm rook-ceph-operator-config -n rook-ceph --type json --patch  '[{ "op": "add", "path": "/data/ROOK_CSI_CEPH_IMAGE", "value": "madhupr001/cephcsi:v2" }]' --context="${SECONDARY_CLUSTER}"

# SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME=$(kubectl get cephblockpools.ceph.rook.io blockpool --context="${SECONDARY_CLUSTER}" -nrook-ceph -o jsonpath='{.status.info.rbdMirrorBootstrapPeerSecretName}')

SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME=cluster-peer-token-my-cluster

SECONDARY_CLUSTER_SECRET=$(kubectl get secret -n rook-ceph "${SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME}" --context=${SECONDARY_CLUSTER} -o jsonpath='{.data.token}'| base64 -d)

#SECONDARY_CLUSTER_SITE_NAME=$(kubectl get cephblockpools.ceph.rook.io blockpool --context=${SECONDARY_CLUSTER} -nrook-ceph -o jsonpath='{.status.mirroringInfo.summary.summary.site_name}')

#SECONDARY_CLUSTER_SITE_NAME=$(kubectl get cephblockpools.ceph.rook.io blockpool --context=${SECONDARY_CLUSTER} -nrook-ceph -o jsonpath='{.status.mirroringInfo.site_name}')

SECONDARY_CLUSTER_SITE_NAME=test

echo SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME is $SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME
echo Token for the secondary cluster is $SECONDARY_CLUSTER_SECRET
echo SECONDARY_CLUSTER_SITE_NAME is ${SECONDARY_CLUSTER_SITE_NAME}

kubectl -n rook-ceph create secret generic --context="${PRIMARY_CLUSTER}" "${SECONDARY_CLUSTER_SITE_NAME}" \
        --from-literal=token=${SECONDARY_CLUSTER_SECRET} \
--from-literal=pool=replicapool

cat <<EOF | kubectl --context="${PRIMARY_CLUSTER}" apply -f -
apiVersion: ceph.rook.io/v1
kind: CephRBDMirror
metadata:
  name: my-rbd-mirror
  namespace: rook-ceph
spec:
  count: 1
EOF

kubectl -n rook-ceph --context="${PRIMARY_CLUSTER}" patch cephblockpool replicapool --type merge -p '{"spec":{"mirroring":{"peers": {"secretNames": ["'${SECONDARY_CLUSTER_SITE_NAME}'"]}}}}'

sleep 10

if kubectl --context="${PRIMARY_CLUSTER}" -n rook-ceph  get pods | grep -q rbd-mirror
then
        echo "Found rbd mirror pod, Great!"
else
        echo "Did not find rbd mirror pod, :("
        exit 1
fi

sleep 5

if [[ $(kubectl get cephblockpools.ceph.rook.io replicapool --context="${PRIMARY_CLUSTER}" -nrook-ceph -o jsonpath='{.status.mirroringStatus.summary.summary.daemon_health}') != "OK" ]]
then 
        echo "daemon health not OK"
        exit 1
fi

if [[ $(kubectl get cephblockpools.ceph.rook.io replicapool --context="${PRIMARY_CLUSTER}" -nrook-ceph -o jsonpath='{.status.mirroringStatus.summary.summary.health}') != "OK" ]]
then 
        echo "health not OK"
        exit 1
fi
if [[ $(kubectl get cephblockpools.ceph.rook.io replicapool --context="${PRIMARY_CLUSTER}" -nrook-ceph -o jsonpath='{.status.mirroringStatus.summary.summary.image_health}') != "OK" ]]
then 
        echo "image health not OK"
        exit 1
fi


exit 0
