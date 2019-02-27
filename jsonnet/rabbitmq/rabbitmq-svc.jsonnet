(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.rabbitmq.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("rabbitmq-port:%s:%s", [
      $._config.rabbitmq.port,
      $._config.rabbitmq.port,
    ]),
  ],
}
