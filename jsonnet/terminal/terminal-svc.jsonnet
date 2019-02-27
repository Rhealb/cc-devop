(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.terminal.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("tm-http-port:%s:%s", [
      $._config.terminal.port,
      $._config.node_ports.terminal,
    ]),
  ],
}
