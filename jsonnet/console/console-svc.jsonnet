(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.console.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("c-http-port:%s:%s", [
      $._config.console.port,
      $._config.node_ports.console,
    ]),
  ],
}
