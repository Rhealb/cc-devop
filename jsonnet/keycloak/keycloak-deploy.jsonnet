(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.keycloak.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.keycloak.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.keycloak.requests_cpu,
  _spec_requests_memory: $._config.resource.keycloak.requests_memory,
  _spec_limits_cpu: $._config.resource.keycloak.limits_cpu,
  _spec_limits_memory: $._config.resource.keycloak.limits_memory,
  _spec_image_name:: $._config.keycloak.image_name,
  _spec_probe_delay: $._config.resource.keycloak.probe,
  _spec_envs:: [
    // config server
    std.format("KEYCLOAK_USER:%s", [
      $._config.confidential.keycloak.username,
    ]),
    std.format("KEYCLOAK_PASSWORD:%s", [
      $._config.confidential.keycloak.password,
    ]),
    std.format("DB_ADDR:%s.%s", [
      $._config.mysql.service,
      $._config.namespaces.console,
    ]),
    std.format("DB_USER:%s", [
      $._config.confidential.mysql.username,
    ]),
    std.format("DB_PASSWORD:%s", [
      $._config.confidential.mysql.password,
    ]),
    std.format("DB_DATABASE:%s", [
      $._config.mysql.keycloak_database,
    ]),
    std.format("CONSOLE_ACCOUNT:http://%s:%s/#/auth/account", [
      $._config.global.public_vip,
      $._config.node_ports.console,
    ]),
    std.format("CONSOLE_PWD:http://%s:%s/#/auth/forgetPwd", [
      $._config.global.public_vip,
      $._config.node_ports.console,
    ]),
    "DB_VENDOR:mysql",
    "JAVA_OPTS:-server -Xms256m -Xmx1024m -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=512m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true",
  ],
  _spec_ports:: [
    std.format("kc-port:%s", [
      $._config.keycloak.port,
    ]),
  ],
}
