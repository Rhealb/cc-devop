(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.notification.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.notification.requests_cpu,
  _spec_requests_memory: $._config.resource.notification.requests_memory,
  _spec_limits_cpu: $._config.resource.notification.limits_cpu,
  _spec_limits_memory: $._config.resource.notification.limits_memory,
  _spec_probe_delay: $._config.resource.notification.probe,
  _spec_image_name:: "cc-notification",
  _spec_envs:: [
    std.format("CONFIG_SERVER_HOST:%s", [
      $._config.config_server.service,
    ]),
    std.format("CONFIG_SERVER_PORT:%s", [
      $._config.config_server.port,
    ]),
    std.format("CONFIG_SERVER_USERNAME:%s", [
      $._config.config_server.username,
    ]),
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("nt-http-port:%s", [
      $._config.notification.http_port,
    ]),
    std.format("nt-grpc-port:%s", [
      $._config.notification.grpc_port,
    ]),
  ],
}
