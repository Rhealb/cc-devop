(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.local_repository.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("lr-http-port:%s:%s", [
      $._config.local_repository.port,
      $._config.node_ports.local_repository,
    ]),
  ],
}
