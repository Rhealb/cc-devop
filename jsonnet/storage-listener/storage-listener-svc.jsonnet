(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.storage_listener.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("stl-http-port:%s:%s", [
      $._config.storage_listener.port,
      $._config.storage_listener.port,
    ]),
  ],
}
