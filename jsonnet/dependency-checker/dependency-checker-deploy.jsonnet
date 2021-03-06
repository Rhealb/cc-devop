(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.dependency_checker.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.dependency_checker.requests_cpu,
  _spec_requests_memory: $._config.resource.dependency_checker.requests_memory,
  _spec_limits_cpu: $._config.resource.dependency_checker.limits_cpu,
  _spec_limits_memory: $._config.resource.dependency_checker.limits_memory,
  _spec_image_name:: $._config.dependency_checker.image_name,
  _spec_probe_delay: $._config.resource.dependency_checker.probe,
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
    std.format("ETCD_HOST:%s", [
      $._config.etcd.service,
    ]),
    std.format("ETCD_PORT:%s", [
      $._config.etcd.server_port,
    ]),
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("dc-port:%s", [
      $._config.dependency_checker.port,
    ]),
  ],
}
