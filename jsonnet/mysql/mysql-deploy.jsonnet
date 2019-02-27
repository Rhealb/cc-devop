(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.mysql.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // local variables
  _spec_version:: $._config.mysql.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  // override super variables of deployment.jsonnet
  _spec_requests_cpu:: $._config.resource.mysql.requests_cpu,
  _spec_requests_memory:: $._config.resource.mysql.requests_memory,
  _spec_limits_cpu:: $._config.resource.mysql.limits_cpu,
  _spec_limits_memory:: $._config.resource.mysql.limits_memory,
  _spec_probe_enabled:: false,
  _spec_image_name:: "mysql-binlog-utf8",
  _spec_envs:: [
    std.format("MYSQL_ROOT_PASSWORD:%s", [
      $._config.confidential.mysql.password,
    ]),
    std.format("MYSQL_DATABASE:%s", [
      $._config.mysql.console_database,
    ]),
  ],
  _spec_volume_mounts:: [
    std.format("%s:%s", [
      $._config.mysql.storage,
      $._config.mysql.mount_path,
    ]),
  ],
  _spec_ports:: [
    std.format("mysql-port:%s", [
      $._config.mysql.port,
    ]),
  ],
  _spec_volumes:: [
    std.format("%s:%s:%s", [
      $._config.mysql.storage,
      $._config.persistentVolumeClaim,
      $._config.mysql.storage,
    ]),
  ],
}
