(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.notification.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  _spec_type:: "ClusterIP",
  _spec_ports:: [
    std.format("nt-http-port:%s:%s", [
      $._config.notification.http_port,
      $._config.notification.http_port,
    ]),
    std.format("nt-grpc-port:%s:%s", [
      $._config.notification.grpc_port,
      $._config.notification.grpc_port,
    ]),
  ],
}
