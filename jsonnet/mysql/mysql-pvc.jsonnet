(import "common/pvc.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.mysql.storage,
  _meta_namespace:: $._config.namespaces.console,
  _spec_storage_size:: $._config.mysql.storage_size,
}
