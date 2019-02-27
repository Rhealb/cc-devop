// Secret template
{
  // global variables
  _meta_name:: "tbd",
  _meta_namespace:: "tbd",
  _data:: {},
  _type:: "Opaque",
  _spec_access_modes:: ["ReadOnlyMany"],

  apiVersion: "v1",
  kind: "Secret",
  metadata: {
    name: $._meta_name,
    namespace: $._meta_namespace,
  },
  type: $._type,
  data: $._data,
}
