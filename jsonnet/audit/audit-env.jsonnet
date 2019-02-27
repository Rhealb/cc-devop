{
  // config variables
  _global_config:: {},
  // content
  spring: {
    datasource: {
      url: std.format("jdbc:mysql://%s.%s:%s/%s?autoReconnect=true", [
        $._global_config.mysql.service,
        $._global_config.namespaces.console,
        $._global_config.mysql.port,
        $._global_config.mysql.console_database,
      ]),
      username: $._global_config.confidential.mysql.username,
      password: $._global_config.confidential.mysql.password,
      "driver-class-name": "com.mysql.jdbc.Driver",
      testWhileIdle: true,
      timeBetweenEvictionRunsMillis: 60000,
      validationQuery: "SELECT 1",
    },
    jpa: {
      "show-sql": false,
      hibernate: {
        "ddl-auto": "update",
      },
    },
    rabbitmq: {
      host: std.format("%s.%s", [
        $._global_config.rabbitmq.service,
        $._global_config.namespaces.console,
      ]),
      port: $._global_config.rabbitmq.port,
      username: $._global_config.confidential.rabbitmq.username,
      password: $._global_config.confidential.rabbitmq.password,
      listener: {
        simple: {
          retry: {
            enabled: true,
            "max-attempts": 5,
            "initial-interval": 5000,
            multiplier: 5,
            "max-interval": 60000,
          },
        },
      },
    },
  },
  keycloak: {
    datasource: {
      url: std.format("jdbc:mysql://%s.%s:%s/%s?autoReconnect=true", [
        $._global_config.mysql.service,
        $._global_config.namespaces.console,
        $._global_config.mysql.port,
        $._global_config.mysql.keycloak_database,
      ]),
      username: $._global_config.confidential.mysql.username,
      password: $._global_config.confidential.mysql.password,
      "driver-class-name": "com.mysql.jdbc.Driver",
      testWhileIdle: true,
      timeBetweenEvictionRunsMillis: 60000,
      validationQuery: "SELECT 1",
    },
  },
  httpProxy: "",
  account: {
    url: std.format("http://%s.%s:%s/gw/ac/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
  },
  backend: {
    url: std.format("http://%s.%s:%s/gw/be/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
  },
  console: {
    adUser: $._global_config.confidential.keystone.username,
    adPassword: $._global_config.confidential.keystone.password,
    authUrl: std.format("http://%s.%s:%s/gw/kc/auth/realms/console-sso/protocol/openid-connect/token", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
    backendUrl: std.format("http://%s.%s:%s/gw/be/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
    "keycloak-client-id": std.format("KEYCLOAK_CLIENT_ID:%s", [
      $._global_config.keycloak_config.client.console,
    ]),
  },
  audit: {
    "http-connect-timeout-millis": 60000,
    "http-read-timeout-millis": 60000,
    "http-write-timeout-millis": 60000,
    threads: 5,
    namespace: $._global_config.namespaces.console,
    storageName: $._global_config.misc.mysql_storage,
    storageLimit: $._global_config.audit_clear.storage_limit,
    tableLimit: $._global_config.audit_clear.table_limit,
    clearPercent: $._global_config.audit_clear.clear_percent,
  },
  logging: {
    level: {
      root: "INFO",
      "cc.audit": "DEBUG",
    },
    file: "/var/log/cc-audit.log",
  },
  enn: {
    security: {
      enable: true,
      receive: "AUDIT",
      "white-list-type": "normal",
      "white-list": "/api/v1/health:GET",
    },
    filter: {
      enable: true,
    },
    http: {
      "connect-timeout-millis": 30000,
      "read-timeout-millis": 60000,
      "write-timeout-millis": 60000,
    },
  },
}
