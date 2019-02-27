(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.terminal.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.terminal.requests_cpu,
  _spec_requests_memory: $._config.resource.terminal.requests_memory,
  _spec_limits_cpu: $._config.resource.terminal.limits_cpu,
  _spec_limits_memory: $._config.resource.terminal.limits_memory,
  _spec_image_name:: $._config.terminal.image_name,
  _spec_probe_delay: $._config.resource.terminal.probe,
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
    // k8s
    std.format("K8S_MASTER_HOST:%s.%s", [
      $._config.k8s.service,
      $._config.namespaces.k8s,
    ]),
    std.format("K8S_MASTER_PORT:%s", [
      $._config.k8s.port,
    ]),
    std.format("K8S_ADMIN_USERNAME:%s", [
      $._config.confidential.k8s.username,
    ]),
    std.format("K8S_ADMIN_PASSWORD:%s", [
      $._config.confidential.k8s.password,
    ]),
    // auth
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
    std.format("ACCOUNT_URL:http://%s.%s:%s/gw/ac/api/v1/", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    "CACHE_ENABLED:false",
    // spring boot
    "spring_profiles_active:prod",
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("terminal-port:%s", [
      $._config.terminal.port,
    ]),
  ],
}
