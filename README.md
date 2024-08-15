# minikube-ceph-mirror
Scripts to create a 2 cluster minikube ceph mirroring setup

# To Create the cluster

```bash=
$./minikube-mirror-cluster-setup.sh 
PROFILE is minicluster1
😄  [minicluster1] minikube v1.31.2 on Fedora 32
❗  minikube skips various validations when --force is supplied; this may lead to unexpected behavior
✨  Using the kvm2 driver based on user configuration
🛑  The "kvm2" driver should not be used with root privileges. If you wish to continue as root, use --force.
💡  If you are running minikube within a VM, consider using --driver=none:
📘    https://minikube.sigs.k8s.io/docs/reference/drivers/none/
👍  Starting control plane node minicluster1 in cluster minicluster1
🔥  Creating kvm2 VM (CPUs=2, Memory=6000MB, Disk=30720MB) ...
🐳  Preparing Kubernetes v1.27.0 on Docker 24.0.4 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minicluster1" cluster and "default" namespace by default
namespace/rook-ceph created
clusterrole.rbac.authorization.k8s.io/cephfs-csi-nodeplugin created
clusterrole.rbac.authorization.k8s.io/cephfs-external-provisioner-runner created
clusterrole.rbac.authorization.k8s.io/objectstorage-provisioner-role created
clusterrole.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
clusterrole.rbac.authorization.k8s.io/rbd-external-provisioner-runner created
clusterrole.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
clusterrole.rbac.authorization.k8s.io/rook-ceph-global created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-system created
clusterrole.rbac.authorization.k8s.io/rook-ceph-object-bucket created
clusterrole.rbac.authorization.k8s.io/rook-ceph-osd created
clusterrole.rbac.authorization.k8s.io/rook-ceph-system created
clusterrolebinding.rbac.authorization.k8s.io/cephfs-csi-nodeplugin-role created
clusterrolebinding.rbac.authorization.k8s.io/cephfs-csi-provisioner-role created
clusterrolebinding.rbac.authorization.k8s.io/objectstorage-provisioner-role-binding created
clusterrolebinding.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
clusterrolebinding.rbac.authorization.k8s.io/rbd-csi-provisioner-role created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-global created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-object-bucket created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-osd created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-system created
role.rbac.authorization.k8s.io/cephfs-external-provisioner-cfg created
role.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
role.rbac.authorization.k8s.io/rbd-external-provisioner-cfg created
role.rbac.authorization.k8s.io/rook-ceph-cmd-reporter created
role.rbac.authorization.k8s.io/rook-ceph-mgr created
role.rbac.authorization.k8s.io/rook-ceph-osd created
role.rbac.authorization.k8s.io/rook-ceph-purge-osd created
role.rbac.authorization.k8s.io/rook-ceph-rgw created
role.rbac.authorization.k8s.io/rook-ceph-system created
rolebinding.rbac.authorization.k8s.io/cephfs-csi-provisioner-role-cfg created
rolebinding.rbac.authorization.k8s.io/rbd-csi-nodeplugin-role-cfg created
rolebinding.rbac.authorization.k8s.io/rbd-csi-provisioner-role-cfg created
rolebinding.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
rolebinding.rbac.authorization.k8s.io/rook-ceph-cmd-reporter created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-system created
rolebinding.rbac.authorization.k8s.io/rook-ceph-osd created
rolebinding.rbac.authorization.k8s.io/rook-ceph-purge-osd created
rolebinding.rbac.authorization.k8s.io/rook-ceph-rgw created
rolebinding.rbac.authorization.k8s.io/rook-ceph-system created
serviceaccount/objectstorage-provisioner created
serviceaccount/rook-ceph-cmd-reporter created
serviceaccount/rook-ceph-default created
serviceaccount/rook-ceph-mgr created
serviceaccount/rook-ceph-osd created
serviceaccount/rook-ceph-purge-osd created
serviceaccount/rook-ceph-rgw created
serviceaccount/rook-ceph-system created
serviceaccount/rook-csi-cephfs-plugin-sa created
serviceaccount/rook-csi-cephfs-provisioner-sa created
serviceaccount/rook-csi-rbd-plugin-sa created
serviceaccount/rook-csi-rbd-provisioner-sa created
customresourcedefinition.apiextensions.k8s.io/cephblockpoolradosnamespaces.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephblockpools.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephbucketnotifications.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephbuckettopics.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephclients.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephclusters.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephcosidrivers.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystemmirrors.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystems.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystemsubvolumegroups.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephnfses.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectrealms.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstores.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstoreusers.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectzonegroups.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectzones.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephrbdmirrors.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/objectbucketclaims.objectbucket.io created
customresourcedefinition.apiextensions.k8s.io/objectbuckets.objectbucket.io created
configmap/rook-ceph-operator-config created
deployment.apps/rook-ceph-operator created
namespace/csi-addons-system created
configmap/csi-addons-manager-config created
deployment.apps/csi-addons-controller-manager created
customresourcedefinition.apiextensions.k8s.io/csiaddonsnodes.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/encryptionkeyrotationcronjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/encryptionkeyrotationjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/networkfences.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/reclaimspacecronjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/reclaimspacejobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplicationclasses.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplicationcontents.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplications.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumereplicationclasses.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumereplications.replication.storage.openshift.io created
serviceaccount/csi-addons-controller-manager created
role.rbac.authorization.k8s.io/csi-addons-leader-election-role created
clusterrole.rbac.authorization.k8s.io/csi-addons-manager-role created
clusterrole.rbac.authorization.k8s.io/csi-addons-metrics-reader created
clusterrole.rbac.authorization.k8s.io/csi-addons-proxy-role created
rolebinding.rbac.authorization.k8s.io/csi-addons-leader-election-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/csi-addons-manager-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/csi-addons-proxy-rolebinding created
service/csi-addons-controller-manager-metrics-service created
configmap/rook-config-override created
cephcluster.ceph.rook.io/my-cluster created
deployment.apps/rook-ceph-tools created
cephblockpool.ceph.rook.io/replicapool created
PROFILE is minicluster2
😄  [minicluster2] minikube v1.31.2 on Fedora 32
❗  minikube skips various validations when --force is supplied; this may lead to unexpected behavior
✨  Using the kvm2 driver based on user configuration
🛑  The "kvm2" driver should not be used with root privileges. If you wish to continue as root, use --force.
💡  If you are running minikube within a VM, consider using --driver=none:
📘    https://minikube.sigs.k8s.io/docs/reference/drivers/none/
👍  Starting control plane node minicluster2 in cluster minicluster2
🔥  Creating kvm2 VM (CPUs=2, Memory=6000MB, Disk=30720MB) ...
🐳  Preparing Kubernetes v1.27.0 on Docker 24.0.4 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🔎  Verifying Kubernetes components...
E0815 16:09:45.611659  201549 start.go:898] failed to inject {"host.minikube.internal": 192.168.121.1} host record into CoreDNS
Failed to inject host.minikube.internal into CoreDNS, this will limit the pods access to the host IP🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minicluster2" cluster and "default" namespace by default
namespace/rook-ceph created
clusterrole.rbac.authorization.k8s.io/cephfs-csi-nodeplugin created
clusterrole.rbac.authorization.k8s.io/cephfs-external-provisioner-runner created
clusterrole.rbac.authorization.k8s.io/objectstorage-provisioner-role created
clusterrole.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
clusterrole.rbac.authorization.k8s.io/rbd-external-provisioner-runner created
clusterrole.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
clusterrole.rbac.authorization.k8s.io/rook-ceph-global created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-system created
clusterrole.rbac.authorization.k8s.io/rook-ceph-object-bucket created
clusterrole.rbac.authorization.k8s.io/rook-ceph-osd created
clusterrole.rbac.authorization.k8s.io/rook-ceph-system created
clusterrolebinding.rbac.authorization.k8s.io/cephfs-csi-nodeplugin-role created
clusterrolebinding.rbac.authorization.k8s.io/cephfs-csi-provisioner-role created
clusterrolebinding.rbac.authorization.k8s.io/objectstorage-provisioner-role-binding created
clusterrolebinding.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
clusterrolebinding.rbac.authorization.k8s.io/rbd-csi-provisioner-role created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-global created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-object-bucket created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-osd created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-system created
role.rbac.authorization.k8s.io/cephfs-external-provisioner-cfg created
role.rbac.authorization.k8s.io/rbd-csi-nodeplugin created
role.rbac.authorization.k8s.io/rbd-external-provisioner-cfg created
role.rbac.authorization.k8s.io/rook-ceph-cmd-reporter created
role.rbac.authorization.k8s.io/rook-ceph-mgr created
role.rbac.authorization.k8s.io/rook-ceph-osd created
role.rbac.authorization.k8s.io/rook-ceph-purge-osd created
role.rbac.authorization.k8s.io/rook-ceph-rgw created
role.rbac.authorization.k8s.io/rook-ceph-system created
rolebinding.rbac.authorization.k8s.io/cephfs-csi-provisioner-role-cfg created
rolebinding.rbac.authorization.k8s.io/rbd-csi-nodeplugin-role-cfg created
rolebinding.rbac.authorization.k8s.io/rbd-csi-provisioner-role-cfg created
rolebinding.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
rolebinding.rbac.authorization.k8s.io/rook-ceph-cmd-reporter created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-system created
rolebinding.rbac.authorization.k8s.io/rook-ceph-osd created
rolebinding.rbac.authorization.k8s.io/rook-ceph-purge-osd created
rolebinding.rbac.authorization.k8s.io/rook-ceph-rgw created
rolebinding.rbac.authorization.k8s.io/rook-ceph-system created
serviceaccount/objectstorage-provisioner created
serviceaccount/rook-ceph-cmd-reporter created
serviceaccount/rook-ceph-default created
serviceaccount/rook-ceph-mgr created
serviceaccount/rook-ceph-osd created
serviceaccount/rook-ceph-purge-osd created
serviceaccount/rook-ceph-rgw created
serviceaccount/rook-ceph-system created
serviceaccount/rook-csi-cephfs-plugin-sa created
serviceaccount/rook-csi-cephfs-provisioner-sa created
serviceaccount/rook-csi-rbd-plugin-sa created
serviceaccount/rook-csi-rbd-provisioner-sa created
customresourcedefinition.apiextensions.k8s.io/cephblockpoolradosnamespaces.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephblockpools.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephbucketnotifications.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephbuckettopics.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephclients.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephclusters.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephcosidrivers.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystemmirrors.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystems.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystemsubvolumegroups.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephnfses.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectrealms.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstores.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstoreusers.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectzonegroups.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectzones.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephrbdmirrors.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/objectbucketclaims.objectbucket.io created
customresourcedefinition.apiextensions.k8s.io/objectbuckets.objectbucket.io created
configmap/rook-ceph-operator-config created
deployment.apps/rook-ceph-operator created
namespace/csi-addons-system created
configmap/csi-addons-manager-config created
deployment.apps/csi-addons-controller-manager created
customresourcedefinition.apiextensions.k8s.io/csiaddonsnodes.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/encryptionkeyrotationcronjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/encryptionkeyrotationjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/networkfences.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/reclaimspacecronjobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/reclaimspacejobs.csiaddons.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplicationclasses.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplicationcontents.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumegroupreplications.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumereplicationclasses.replication.storage.openshift.io created
customresourcedefinition.apiextensions.k8s.io/volumereplications.replication.storage.openshift.io created
serviceaccount/csi-addons-controller-manager created
role.rbac.authorization.k8s.io/csi-addons-leader-election-role created
clusterrole.rbac.authorization.k8s.io/csi-addons-manager-role created
clusterrole.rbac.authorization.k8s.io/csi-addons-metrics-reader created
clusterrole.rbac.authorization.k8s.io/csi-addons-proxy-role created
rolebinding.rbac.authorization.k8s.io/csi-addons-leader-election-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/csi-addons-manager-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/csi-addons-proxy-rolebinding created
service/csi-addons-controller-manager-metrics-service created
configmap/rook-config-override created
cephcluster.ceph.rook.io/my-cluster created
deployment.apps/rook-ceph-tools created
cephblockpool.ceph.rook.io/replicapool created
```

# Check the cluster is created and ceph cluster is ready on both minikube clusters

```
# kubectl --context=minicluster2 get nodes && kubectl --context=minicluster1 get nodes
NAME           STATUS   ROLES           AGE     VERSION
minicluster2   Ready    control-plane   6m47s   v1.27.0
NAME           STATUS   ROLES           AGE     VERSION
minicluster1   Ready    control-plane   8m28s   v1.27.0
[root@minikube-ceph-mirror]# kubectl --context=minicluster2 get cephcluster -nrook-ceph && kubectl --context=minicluster1 get cephcluster -nrook-ceph
NAME         DATADIRHOSTPATH   MONCOUNT   AGE     PHASE   MESSAGE                        HEALTH      EXTERNAL   FSID
my-cluster   /var/lib/rook     1          5m46s   Ready   Cluster created successfully   HEALTH_OK              d45b8977-2d94-45bb-87d4-ef0fe55f9bdf
NAME         DATADIRHOSTPATH   MONCOUNT   AGE     PHASE   MESSAGE                        HEALTH      EXTERNAL   FSID
my-cluster   /var/lib/rook     1          7m44s   Ready   Cluster created successfully   HEALTH_OK              5d7d5672-8658-4936-b453-5e75000c0277
```

#Enable mirroring between 2 clusters

```bash=
# ./minikube-enable-mirroring.sh mirror
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
configmap/rook-ceph-operator-config patched (no change)
PRIMARY_CLUSTER_PEER_TOKEN_SECRET_NAME is pool-peer-token-replicapool
SECONDARY_CLUSTER_PEER_TOKEN_SECRET_NAME is pool-peer-token-replicapool
Token for the primary cluster is eyJmc2lkIjoiNWQ3ZDU2NzItODY1OC00OTM2LWI0NTMtNWU3NTAwMGMwMjc3IiwiY2xpZW50X2lkIjoicmJkLW1pcnJvci1wZWVyIiwia2V5IjoiQVFDYjRMMW1sTGNmSmhBQW8vRjA3aDhzaGNOc3FMcmNsaFNpS0E9PSIsIm1vbl9ob3N0IjoiW3YyOjE5Mi4xNjguMTIxLjM0OjMzMDAvMCx2MToxOTIuMTY4LjEyMS4zNDo2Nzg5LzBdIiwibmFtZXNwYWNlIjoicm9vay1jZXBoIn0=
Token for the secondary cluster is eyJmc2lkIjoiZDQ1Yjg5NzctMmQ5NC00NWJiLTg3ZDQtZWYwZmU1NWY5YmRmIiwiY2xpZW50X2lkIjoicmJkLW1pcnJvci1wZWVyIiwia2V5IjoiQVFDaTRMMW00MUt1RGhBQXRXUjNrZWNEdmpJZ0NOQkw0Ty8zekE9PSIsIm1vbl9ob3N0IjoiW3YyOjE5Mi4xNjguMTIxLjE2NDozMzAwLzAsdjE6MTkyLjE2OC4xMjEuMTY0OjY3ODkvMF0iLCJuYW1lc3BhY2UiOiJyb29rLWNlcGgifQ==
PRIMARY_CLUSTER_SITE_NAME is 5d7d5672-8658-4936-b453-5e75000c0277
SECONDARY_CLUSTER_SITE_NAME is d45b8977-2d94-45bb-87d4-ef0fe55f9bdf
secret/d45b8977-2d94-45bb-87d4-ef0fe55f9bdf created
secret/5d7d5672-8658-4936-b453-5e75000c0277 created
cephrbdmirror.ceph.rook.io/my-rbd-mirror unchanged
cephrbdmirror.ceph.rook.io/my-rbd-mirror created
cephblockpool.ceph.rook.io/replicapool patched
cephblockpool.ceph.rook.io/replicapool patched
Found rbd mirror pod, Great!
Found rbd mirror pod, Great!
```

# Create PVC and mirror it

```bash=
./minikube-mirror-rbd-image.sh 
storageclass.storage.k8s.io/rook-ceph-block unchanged
persistentvolumeclaim/rbd-pvc-test-1 created
RBD_IMAGE_NAME is csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a
CEPH_TOOLBOX_POD on primary cluster is rook-ceph-tools-6cd5447c78-nvd6c
rbd image 'csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a':
	size 10 GiB in 2560 objects
	order 22 (4 MiB objects)
	snapshot_count: 0
	id: 1294e5144bd1
	block_name_prefix: rbd_data.1294e5144bd1
	format: 2
	features: layering
	op_features: 
	flags: 
	create_timestamp: Thu Aug 15 11:44:49 2024
	access_timestamp: Thu Aug 15 11:44:49 2024
	modify_timestamp: Thu Aug 15 11:44:49 2024
volumereplicationclass.replication.storage.openshift.io/rbd-volumereplicationclass unchanged
volumereplication.replication.storage.openshift.io/rbd-pvc-test-1 created
apiVersion: replication.storage.openshift.io/v1alpha1
kind: VolumeReplication
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"replication.storage.openshift.io/v1alpha1","kind":"VolumeReplication","metadata":{"annotations":{},"name":"rbd-pvc-test-1","namespace":"default"},"spec":{"autoResync":false,"dataSource":{"apiGroup":"","kind":"PersistentVolumeClaim","name":"rbd-pvc-test-1"},"replicationState":"primary","volumeReplicationClass":"rbd-volumereplicationclass"}}
  creationTimestamp: "2024-08-15T11:44:55Z"
  finalizers:
  - replication.storage.openshift.io
  generation: 2
  name: rbd-pvc-test-1
  namespace: default
  resourceVersion: "6525"
  uid: f34e6858-70a5-4266-bf2d-517662958919
spec:
  autoResync: false
  dataSource:
    apiGroup: ""
    kind: PersistentVolumeClaim
    name: rbd-pvc-test-1
  replicationHandle: ""
  replicationState: primary
  volumeReplicationClass: rbd-volumereplicationclass
status:
  conditions:
  - lastTransitionTime: "2024-08-15T11:44:57Z"
    message: ""
    observedGeneration: 2
    reason: Promoted
    status: "True"
    type: Completed
  - lastTransitionTime: "2024-08-15T11:44:57Z"
    message: ""
    observedGeneration: 2
    reason: Healthy
    status: "False"
    type: Degraded
  - lastTransitionTime: "2024-08-15T11:44:57Z"
    message: ""
    observedGeneration: 2
    reason: NotResyncing
    status: "False"
    type: Resyncing
  lastCompletionTime: "2024-08-15T11:44:58Z"
  message: volume is marked primary
  observedGeneration: 2
  state: Primary
CEPH_TOOLBOX_POD on primary cluster is rook-ceph-tools-6cd5447c78-nvd6c
CEPH_TOOLBOX_POD on secondary cluster is rook-ceph-tools-6cd5447c78-kgmz2
rbd image 'csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a':
	size 10 GiB in 2560 objects
	order 22 (4 MiB objects)
	snapshot_count: 1
	id: 1294e5144bd1
	block_name_prefix: rbd_data.1294e5144bd1
	format: 2
	features: layering
	op_features: 
	flags: 
	create_timestamp: Thu Aug 15 11:44:49 2024
	access_timestamp: Thu Aug 15 11:44:49 2024
	modify_timestamp: Thu Aug 15 11:44:49 2024
	mirroring state: enabled
	mirroring mode: snapshot
	mirroring global id: 37fc2991-52ba-4dfc-843b-1335035fc02b
	mirroring primary: true
csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a:
  global_id:   37fc2991-52ba-4dfc-843b-1335035fc02b
  state:       up+stopped
  description: local image is primary
  service:     a on minicluster2
  last_update: 2024-08-15 11:45:39
  peer_sites:
    name: 5d7d5672-8658-4936-b453-5e75000c0277
    state: up+replaying
    description: replaying, {"bytes_per_second":0.0,"bytes_per_snapshot":0.0,"last_snapshot_bytes":0,"last_snapshot_sync_seconds":1,"local_snapshot_timestamp":1723722295,"remote_snapshot_timestamp":1723722295,"replay_state":"idle"}
    last_update: 2024-08-15 11:45:40
  snapshots:
    4 .mirror.primary.37fc2991-52ba-4dfc-843b-1335035fc02b.f7aa4e2b-17c4-47e5-b763-98ba49cd95e7 (peer_uuids:[9b63ec17-215c-46ef-88d4-a2fad444e73d])
rbd image 'csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a':
	size 10 GiB in 2560 objects
	order 22 (4 MiB objects)
	snapshot_count: 1
	id: 11c6800d6e88
	block_name_prefix: rbd_data.11c6800d6e88
	format: 2
	features: layering, non-primary
	op_features: 
	flags: 
	create_timestamp: Thu Aug 15 11:44:57 2024
	access_timestamp: Thu Aug 15 11:44:57 2024
	modify_timestamp: Thu Aug 15 11:44:57 2024
	mirroring state: enabled
	mirroring mode: snapshot
	mirroring global id: 37fc2991-52ba-4dfc-843b-1335035fc02b
	mirroring primary: false
csi-vol-7013087e-5788-4dd0-a614-13ae2e33fe3a:
  global_id:   37fc2991-52ba-4dfc-843b-1335035fc02b
  state:       up+replaying
  description: replaying, {"bytes_per_second":0.0,"bytes_per_snapshot":0.0,"last_snapshot_bytes":0,"last_snapshot_sync_seconds":1,"local_snapshot_timestamp":1723722295,"remote_snapshot_timestamp":1723722295,"replay_state":"idle"}
  service:     a on minicluster1
  last_update: 2024-08-15 11:45:40
  peer_sites:
    name: d45b8977-2d94-45bb-87d4-ef0fe55f9bdf
    state: up+stopped
    description: local image is primary
    last_update: 2024-08-15 11:45:39
```

# To Destory the cluster

```bash=
$ ./minikube-mirror-cluster-setup.sh destroy
PROFILE is minicluster1
🔥  Deleting "minicluster1" in kvm2 ...
💀  Removed all traces of the "minicluster1" cluster.
PROFILE is minicluster2
🔥  Deleting "minicluster2" in kvm2 ...
💀  Removed all traces of the "minicluster2" cluster
```

