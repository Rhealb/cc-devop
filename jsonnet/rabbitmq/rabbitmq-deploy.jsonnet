(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.rabbitmq.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.rabbitmq.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.rabbitmq.requests_cpu,
  _spec_requests_memory: $._config.resource.rabbitmq.requests_memory,
  _spec_limits_cpu: $._config.resource.rabbitmq.limits_cpu,
  _spec_limits_memory: $._config.resource.rabbitmq.limits_memory,
  _spec_image_name:: "rabbitmq",
  _spec_probe_enabled:: false,
  _spec_envs:: [
    std.format("RABBITMQ_DEFAULT_USER:%s", [
      $._config.confidential.rabbitmq.username,
    ]),
    std.format("RABBITMQ_DEFAULT_PASS:%s", [
      $._config.confidential.rabbitmq.password,
    ]),
  ],
  _spec_ports:: [
    std.format("rabbitmq-port:%s", [
      $._config.rabbitmq.port,
    ]),
  ],
}
