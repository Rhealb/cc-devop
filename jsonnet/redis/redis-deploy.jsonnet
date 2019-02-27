(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.redis.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.redis.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.redis.requests_cpu,
  _spec_requests_memory: $._config.resource.redis.requests_memory,
  _spec_limits_cpu: $._config.resource.redis.limits_cpu,
  _spec_limits_memory: $._config.resource.redis.limits_memory,
  _spec_image_name:: "cc-redis",
  _spec_probe_enabled:: false,
  _spec_envs:: [
    std.format("PASSWORD:%s", [
      $._config.confidential.redis.password,
    ]),
  ],
  _spec_ports:: [
    std.format("redis-port:%s", [
      $._config.redis.port,
    ]),
  ],
}
