(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.gitbook.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("gb-http-port:%s:%s", [
      $._config.gitbook.port,
      $._config.node_ports.gitbook,
    ]),
  ],
}
