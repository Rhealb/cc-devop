(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.lmd.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.lmd,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("lm-http-port:%s:%s", [
      $._config.lmd.port,
      $._config.node_ports.lmb,
    ]),
  ],
}
