(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.backend.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_replicas:: $._config.replicas.backend,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu:: $._config.resource.backend.requests_cpu,
  _spec_requests_memory:: $._config.resource.backend.requests_memory,
  _spec_limits_cpu:: $._config.resource.backend.limits_cpu,
  _spec_limits_memory:: $._config.resource.backend.limits_memory,
  _spec_image_name:: $._config.backend.image_name,
  _spec_probe_delay: $._config.resource.backend.probe,
  _spec_envs:: [
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
    std.format("K8S_FILTERED_NAMESPACES:%s", [
      $._config.k8s.filtered_namespaces,
    ]),
    std.format("K8S_VIP_HOST:%s", [
      $._config.global.public_vip,
    ]),
    // auth
    std.format("AUTH_ENABLED:%s", [
      $._config.global.auth_enable,
    ]),
    // ceph
    std.format("CEPH_ENABLED:%s", [
      $._config.ceph.enable,
    ]),
    std.format("CEPH_KEY:%s", [
      $._config.ceph.admin_keyring,
    ]),
    std.format("CEPH_USERNAME:%s", [
      $._config.ceph.admin_user,
    ]),
    std.format("CEPH_MON:%s", [
      $._config.ceph.monitor_urls,
    ]),
    std.format("CEPH_MON_HOST:%s", [
      $._config.ceph.monitor_urls,
    ]),
    // nfs
    std.format("NFS_ENABLED:%s", [
      $._config.nfs.enable,
    ]),
    // s3
    std.format("S3_ENABLED:%s", [
      $._config.s3.enable,
    ]),
    std.format("S3_AK:%s", [
      $._config.s3.access_key,
    ]),
    std.format("S3_SK:%s", [
      $._config.s3.secret_key,
    ]),
    std.format("S3_HOST:%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.rgw,
    ]),
    std.format("ACCOUNT:http://%s.%s:%s/gw/ac/api/v1/", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_AUTH_URL:http://%s.%s:%s/gw/kc/auth/realms/console-sso/protocol/openid-connect/token", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    // spring boot
    "spring_profiles_active:legacy_prod",
    "FAIL_FAST:false",
  ],
  _spec_ports:: [
    std.format("backend-port:%s", [
      $._config.backend.port,
    ]),
  ],
}
