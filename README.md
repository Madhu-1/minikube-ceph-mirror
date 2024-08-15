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

