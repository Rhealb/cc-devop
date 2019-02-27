(import "common/service.jsonnet") + {
  _config:: {},
  // override super global variables
  _meta_name:: $._config.keycloak.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("kc-port:%s:%s", [
      $._config.keycloak.port,
      $._config.node_ports.keycloak,
    ]),
  ],
}
