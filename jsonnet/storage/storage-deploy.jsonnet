(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.storage.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.storage.requests_cpu,
  _spec_requests_memory: $._config.resource.storage.requests_memory,
  _spec_limits_cpu: $._config.resource.storage.limits_cpu,
  _spec_limits_memory: $._config.resource.storage.limits_memory,
  _spec_image_name:: $._config.storage.image_name,
  _spec_probe_delay: $._config.resource.storage.probe,
  _spec_privilege: true,
  _spec_envs:: [
    // config server
    std.format("CONFIG_SERVER_HOST:%s", [
      $._config.config_server.service,
    ]),
    std.format("CONFIG_SERVER_PORT:%s", [
      $._config.config_server.port,
    ]),
    std.format("CONFIG_SERVER_USERNAME:%s", [
      $._config.config_server.username,
    ]),
    // mysql
    std.format("MYSQL_HOST:%s.%s", [
      $._config.mysql.service,
      $._config.namespaces.console,
    ]),
    std.format("MYSQL_PORT:%s", [
      $._config.mysql.port,
    ]),
    std.format("MYSQL_USERNAME:%s", [
      $._config.confidential.mysql.username,
    ]),
    std.format("MYSQL_PASSWORD:%s", [
      $._config.confidential.mysql.password,
    ]),
    // rabbitmq
    std.format("RABBITMQ_HOST:%s.%s", [
      $._config.rabbitmq.service,
      $._config.namespaces.console,
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
    // ceph
    std.format("CEPH_KEY:%s", [
      $._config.ceph.admin_keyring,
    ]),
    std.format("CEPH_USERNAME:%s", [
      $._config.ceph.admin_user,
    ]),
    std.format("CEPH_MON_HOST:%s", [
      $._config.ceph.monitor_urls,
    ]),
    std.format("CEPH_ENABLED:%s", [
      $._config.ceph.enable,
    ]),
    std.format("CPEH_USAGE_ENABLED:%s", [
      $._config.ceph.enable,
    ]),
    // nfs
    std.format("NFS_ENABLED:%s", [
      $._config.nfs.enable,
    ]),
    std.format("NFS_USAGE_ENABLED:%s", [
      $._config.nfs.enable,
    ]),
    std.format("NFS_ADDRESS:%s", [
      $._config.nfs.server,
    ]),
    std.format("NFS_SERVER_DIR:%s", [
      $._config.nfs.server_dir,
    ]),
    std.format("NFS_PROPERTIES:%s", [
      $._config.nfs.args,
    ]),
    // k8s
    std.format("K8S_MASTER_URL:https://%s.%s:%s", [
      $._config.k8s.service,
      $._config.namespaces.k8s,
      $._config.k8s.port,
    ]),
    std.format("K8S_ADMIN_USERNAME:%s", [
      $._config.confidential.k8s.username,
    ]),
    std.format("K8S_ADMIN_PASSWORD:%s", [
      $._config.confidential.k8s.password,
    ]),
    "spring_profiles_active:prod",
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("storage-port:%s", [
      $._config.storage.port,
    ]),
  ],
  _spec_volumes:: [
    std.format("%s:%s:%s", [
      $._config.storage.storage,
      $._config.hostPath,
      $._config.storage.storage_path,
    ]),
  ],
}
