(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.audit.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("ad-http-port:%s:%s", [
      $._config.audit.port,
      $._config.audit.port,
    ]),
  ],
}
