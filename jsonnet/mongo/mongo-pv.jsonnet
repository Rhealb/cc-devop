(import "common/pv.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.mongo.storage.name,
  _meta_namespace:: $._config.namespaces.console,
  _spec_storage_size:: $._config.mongo.storage.size,
  _spec_storage_type:: $._config.storage_config.mongo,
  _spec_ceph_monitors:: $._config.ceph.monitors,
}
