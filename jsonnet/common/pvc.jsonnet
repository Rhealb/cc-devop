// PVC template
{
  // global variables
  _meta_name:: "tbd",
  _meta_namespace:: "tbd",
  _spec_storage_size:: "tbd",
  _spec_access_modes:: ["ReadOnlyMany"],

  apiVersion: "v1",
  kind: "PersistentVolumeClaim",
  metadata: {
    name: $._meta_name,
    namespace: $._meta_namespace,
  },
  spec: {
    accessModes: $._spec_access_modes,
    resources: {
      requests: {
        storage: $._spec_storage_size,
      },
    },
    selector: {
      matchLabels: {
        namespaceName: $._meta_namespace,
        storageName: $._meta_name,
      },
    },
  },
}
