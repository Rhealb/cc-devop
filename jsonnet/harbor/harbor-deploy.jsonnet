(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.harbor.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.harbor.requests_cpu,
  _spec_requests_memory: $._config.resource.harbor.requests_memory,
  _spec_limits_cpu: $._config.resource.harbor.limits_cpu,
  _spec_limits_memory: $._config.resource.harbor.limits_memory,
  _spec_probe_delay: $._config.resource.harbor.probe,
  _spec_image_name:: "cc-harbor",
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
    std.format("HARBOR_IMAGE_PORT:%s", [
      $._config.node_ports.harbor,
    ]),
    std.format("HARBOR_ADMIN_USERNAME:%s", [
      $._config.confidential.harbor.username,
    ]),
    std.format("HARBOR_ADMIN_PASSWORD:%s", [
      $._config.confidential.harbor.password,
    ]),
    "HARBOR_URL:http://harbor-proxy.system-tools:80",
    "spring_profiles_active:prod",
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("harbor-port:%s", [
      $._config.harbor.port,
    ]),
  ],
}
