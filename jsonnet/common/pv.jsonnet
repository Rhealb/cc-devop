// PV template
{
  // global variables
  _meta_name:: "tbd",
  _meta_namespace:: "tbd",
  _spec_storage_size:: "tbd",
  _spec_access_modes:: ["ReadOnlyMany"],
  _spec_console_prefix:: "k8s",
  _spec_hostpath_prefix:: "k8s_storage",

  _spec_storage_type:: "rbd",

  // nfs
  _spec_nfs_server:: "nfs.enndata.cn",
  _spec_nfs_directory:: "",
  // cephfs
  _spec_ceph_monitors:: ["mon-1", "mon-2"],
  // rbd
  _spec_rbd_fs_type:: "xfs",

  apiVersion: "v1",
  kind: "PersistentVolume",
  metadata: {
    name: std.format("%s-%s-pv", [
      $._meta_namespace,
      $._meta_name,
    ]),
    [if $._spec_storage_type == "hostPath" then "annotations"]: {
      "io.enndata.user/alpha-pvhostpathmountpolicy": "keep",
      "io.enndata.user/alpha-pvhostpathquotaforonepod": "true",
    },
    namespace: $._meta_namespace,
    labels: {
      namespaceName: $._meta_namespace,
      storageName: $._meta_name,
    },
  },
  spec: {
    capacity: {
      storage: $._spec_storage_size,
    },
    accessModes: $._spec_access_modes,
    [if $._spec_storage_type == "nfs" then "nfs"]: {
      server: $._spec_nfs_server,
      path: std.format("%s/%s/%s/%s", [
        $._spec_nfs_directory,
        $._spec_console_prefix,
        $._meta_namespace,
        $._meta_name,
      ]),
    },
    [if $._spec_storage_type == "cephfs" then "cephfs"]: {
      monitors: $._spec_ceph_monitors,
      path: std.format("/%s/%s/%s", [
        $._spec_console_prefix,
        $._meta_namespace,
        $._meta_name,
      ]),
      secretRef: {
        name: $._meta_namespace,
      },
      user: $._meta_namespace,
    },
    [if $._spec_storage_type == "rbd" then "rbd"]: {
      monitors: $._spec_ceph_monitors,
      fsType: $._spec_rbd_fs_type,
      image: $._meta_name,
      pool: std.format("%s.%s", [
        $._spec_console_prefix,
        $._meta_namespace,
      ]),
      secretRef: {
        name: $._meta_namespace,
      },
      user: $._meta_namespace,
    },
    [if $._spec_storage_type == "hostPath" then "hostPath"]: {
      path: std.format("/%s/%s/%s", [
        $._spec_hostpath_prefix,
        $._meta_namespace,
        $._meta_name,
      ]),
    },
  },
}
