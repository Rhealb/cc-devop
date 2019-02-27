(import "common/pv.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.config_server.storage.name,
  _meta_namespace:: $._config.namespaces.console,
  _spec_storage_size:: $._config.config_server.storage.size,
  _spec_storage_type:: $._config.storage_config.config_server,
  _spec_ceph_monitors:: $._config.ceph.monitors,
  _spec_nfs_server:: $._config.nfs.server,
  _spec_nfs_directory:: $._config.nfs.server_dir,
}
