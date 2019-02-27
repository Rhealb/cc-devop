(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.dependency_checker.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("dc-http-port:%s:%s", [
      $._config.dependency_checker.port,
      $._config.dependency_checker.port,
    ]),
  ],
}
