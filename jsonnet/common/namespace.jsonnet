// Namespace template
{
  // global variables
  _meta_name:: "tbd",

  apiVersion: "v1",
  kind: "Namespace",
  metadata: {
    name: $._meta_name,
    annotations: {
      "io.enndata.namespace/alpha-allowhostpath": "true",
      "io.enndata.namespace/alpha-allowprivilege": "true",
    },
  },
}
