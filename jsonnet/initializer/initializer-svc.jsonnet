(import "common/service.jsonnet") + {
  _config:: {},
  // override super global variables
  _meta_name:: $._config.initializer.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_ports:: [
    std.format("in-http-port:%s:%s", [
      $._config.initializer.port,
      $._config.initializer.port,
    ]),
  ],
}
