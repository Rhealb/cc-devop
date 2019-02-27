(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.gateway.service,
  _meta_namespace:: $._config.namespaces.gateway,
  _meta_app:: $._config.apps.gateway,
  // spec
  _spec_replicas:: $._config.replicas.gateway,
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.gateway.requests_cpu,
  _spec_requests_memory: $._config.resource.gateway.requests_memory,
  _spec_limits_cpu: $._config.resource.gateway.limits_cpu,
  _spec_limits_memory: $._config.resource.gateway.limits_memory,
  _spec_image_name:: $._config.gateway.image_name,
  _spec_probe_delay: $._config.resource.gateway.probe,
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
    // redis
    std.format("REDIS_HOST:%s.%s", [
      $._config.redis.service,
      $._config.namespaces.console,
    ]),
    std.format("REDIS_PORT:%s", [
      $._config.redis.port,
    ]),
    std.format("REDIS_USERNAME:%s", [
      $._config.confidential.redis.username,
    ]),
    std.format("REDIS_PASSWORD:%s", [
      $._config.confidential.redis.password,
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
    // console urls
    std.format("BACKEND_URL:http://%s.%s:%s", [
      $._config.backend.service,
      $._config.namespaces.console,
      $._config.backend.port,
    ]),
    std.format("ORIGIN_URL:http://%s.%s:%s", [
      $._config.kubeorigin.service,
      $._config.namespaces.console,
      $._config.kubeorigin.port,
    ]),
    std.format("NOTIFICATION_URL:http://%s.%s:%s", [
      $._config.notification.service,
      $._config.namespaces.console,
      $._config.notification.http_port,
    ]),
    std.format("HARBOR_URL:http://%s.%s:%s", [
      $._config.harbor.service,
      $._config.namespaces.console,
      $._config.harbor.port,
    ]),
    std.format("INITIALIZER_URL:http://%s.%s:%s", [
      $._config.initializer.service,
      $._config.namespaces.console,
      $._config.initializer.port,
    ]),
    std.format("ACCOUNT_URL:http://%s.%s:%s", [
      $._config.account.service,
      $._config.namespaces.console,
      $._config.account.port,
    ]),
    std.format("ANSIBLE_URL:http://%s.%s:%s", [
      $._config.ansible.service,
      $._config.namespaces.console,
      $._config.ansible.port,
    ]),
    std.format("AUDIT_URL:http://%s.%s:%s", [
      $._config.audit.service,
      $._config.namespaces.console,
      $._config.audit.port,
    ]),
    std.format("LOG_URL:http://%s.%s:%s", [
      $._config.log.service,
      $._config.namespaces.console,
      $._config.log.port,
    ]),
    std.format("METRIC_URL:http://%s.%s:%s", [
      $._config.metric.service,
      $._config.namespaces.console,
      $._config.metric.port,
    ]),
    std.format("WATCH_URL:http://%s.%s:%s", [
      $._config.watch.service,
      $._config.namespaces.console,
      $._config.watch.port,
    ]),
    std.format("TENSORFLOW_URL:http://%s", [
      $._config.misc.tf_url,
    ]),
    std.format("DEPENDENCY_CHECKER_URL:http://%s.%s:%s", [
      $._config.dependency_checker.service,
      $._config.namespaces.console,
      $._config.dependency_checker.port,
    ]),
    std.format("STORAGE_URL:http://%s.%s:%s", [
      $._config.storage.service,
      $._config.namespaces.console,
      $._config.storage.port,
    ]),
    std.format("TEMPLATE_URL:http://%s.%s:%s", [
      $._config.template.service,
      $._config.namespaces.console,
      $._config.template.port,
    ]),
    std.format("CACHE_ENABLED:%s", [
      $._config.keystone.cache_enable,
    ]),
    std.format("AUDIT_ENABLED:%s", [
      $._config.global.auth_enable,
    ]),
    std.format("AUTH_ENABLED:%s", [
      $._config.global.auth_enable,
    ]),
    std.format("COMMAND_LINE_ENABLED:%s", [
      $._config.global.commandline_enable,
    ]),
    std.format("KEYCLOAK_URL:http://%s.%s:%s", [
      $._config.keycloak.service,
      $._config.namespaces.keycloak,
      $._config.keycloak.port,
    ]),
    std.format("KEYCLOAK_REALM:%s", [
      $._config.keycloak_config.realm,
    ]),
    // backend
    std.format("USER:%s", [
      $._config.confidential.keystone.username,
    ]),
    std.format("PASSWORD:%s", [
      $._config.confidential.keystone.password,
    ]),
    std.format("BE_URL:http://%s.%s:%s/api/v1", [
      $._config.backend.service,
      $._config.namespaces.console,
      $._config.backend.port,
    ]),
    "LOGPATTERN:^(?<dateTime>[\\d\\-]+[\\s]*[\\d\\:\\.]+)[\\s]*(?<logLevel>[\\w]+)[\\s]*(?<pid>[\\d]+)[\\s\\-]*\\[(?<threadName>[^\\]]+)\\][\\s]*(?<position>[^\\s]+)[\\s:]*(\\[topic=(?<customTopic>[^\\]]*)\\])?[\\s]*(?<log>.*)",
    "LOGASSEMBLE:%dateTime%,%logLevel%,%threadName%,%position%,%customTopic%,%log%",
    "spring_profiles_active:prod",
    "license_enable:true",
  ],
  _spec_ports:: [
    std.format("gw-http-port:%s", [
      $._config.gateway.http_port,
    ]),
    std.format("gw-https-port:%s", [
      $._config.gateway.https_port,
    ]),
  ],
}
