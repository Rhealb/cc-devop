(import "common/service.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.gateway.service,
  _meta_namespace:: $._config.namespaces.gateway,
  _meta_app:: $._config.apps.gateway,
  _spec_type:: "NodePort",
  _spec_ports:: [
    std.format("gw-http-port:%s:%s", [
      $._config.gateway.http_port,
      $._config.node_ports.gateway_http,
    ]),
    std.format("gw-https-port:%s:%s", [
      $._config.gateway.https_port,
      $._config.node_ports.gateway_https,
    ]),
  ],
}
