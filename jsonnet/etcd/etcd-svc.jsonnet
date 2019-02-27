(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.etcd.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("server-port:%s:%s", [
      $._config.etcd.server_port,
      $._config.etcd.server_port,
    ]),
    std.format("client-port:%s:%s", [
      $._config.etcd.client_port,
      $._config.etcd.client_port,
    ]),
  ],
}
