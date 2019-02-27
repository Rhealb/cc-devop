(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.config_server.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.config_server.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu:: $._config.resource.config_server.requests_cpu,
  _spec_requests_memory:: $._config.resource.config_server.requests_memory,
  _spec_limits_cpu:: $._config.resource.config_server.limits_cpu,
  _spec_limits_memory:: $._config.resource.config_server.limits_memory,
  _spec_image_name: $._config.config_server.image_name,
  _spec_probe_delay: $._config.resource.config_server.probe,
  _spec_envs:: [
    std.format("RABBITMQ_HOST:%s", [
      $._config.rabbitmq.service,
    ]),
    std.format("RABBITMQ_PORT:%s", [
      $._config.rabbitmq.port,
    ]),
    std.format("RABBITMQ_USERNAME:%s", [
      $._config.confidential.rabbitmq.username,
    ]),
    std.format("RABBITMQ_PASSWORD:%s", [
      $._config.confidential.rabbitmq.password,
    ]),
    "SECURITY_BASIC_ENABLED:true",
    "SECURITY_USERNAME:admin",
    "CLOUD_SEARCH_LOCATION:file:/config",
    "CLOUD_ENCRYPT_ENABLED:true",
    "spring_profiles_active:prod",
    "spring_application_name:cc-config-server",
  ],
  _spec_envs_from_key:: [
    std.format("SECURITY_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
    std.format("ENCRYPT_KEY:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_volume_mounts:: [
    std.format("%s:%s", [
      $._config.config_server.storage.name,
      $._config.config_server.storage.mount_path,
    ]),
  ],
  _spec_ports:: [
    std.format("cs-port:%s", [
      $._config.config_server.port,
    ]),
  ],
  _spec_volumes:: [
    std.format("%s:%s:%s", [
      $._config.config_server.storage.name,
      $._config.persistentVolumeClaim,
      $._config.config_server.storage.name,
    ]),
  ],
}
