(import "common/secret.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.namespaces.console,
  _meta_namespace:: $._config.namespaces.console,
  _type:: "kubernetes.io/rbd",
  _data:: {
    key: $._config.ceph.console_keyring_base64,
  },
}
