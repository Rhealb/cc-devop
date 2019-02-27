{
  // config variables
  _global_config:: {},
  // content
  spring: {
    datasource: {
      url: std.format("jdbc:mysql://%s.%s:%s/%s", [
        $._global_config.mysql.service,
        $._global_config.namespaces.console,
        $._global_config.mysql.port,
        $._global_config.mysql.console_database,
      ]),
      username: $._global_config.confidential.mysql.username,
      password: $._global_config.confidential.mysql.password,
      "driver-class-name": "com.mysql.jdbc.Driver",
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
    mail: {
      host: "smtp.xxxx.com",
      port: 25,
      username: "xxxx@xxxx.com",
      password: "xxxxxxxx",
      properties: {
        mail: {
          smtp: {
            socketFactory: {
              port: 465,
              class: "javax.net.ssl.SSLSocketFactory",
            },
            auth: true,
            starttls: {
              enable: true,
              required: true,
            },
          },
          transport: {
            protocol: "smtp",
          },
          smtps: {
            quitwait: false,
          },
        },
      },
    },
  },
  backend: {
    accountUrl: std.format("http://%s.%s:%s/gw/ac/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
    authUrl: std.format("http://%s.%s:%s/gw/kc/auth/realms/console-sso/protocol/openid-connect/token", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
    backendUrl: std.format("http://%s.%s:%s/gw/ac/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
    "keycloak-client-id": $._global_config.keycloak_config.client.console,
    ntUser: $._global_config.confidential.keystone.username,
    ntPassword: $._global_config.confidential.keystone.password,
    prometheusHost: std.format("%s.%s", [
      $._global_config.prometheus.service,
      $._global_config.namespaces.prometheus,
    ]),
    prometheusPort: $._global_config.prometheus.grpc_port,
    cluster: $._global_config.global.cluster_name,
  },
  security: {
    enableFilter: true,
  },
  "logging.level": {
    root: "WARN",
    "cc.notification": "INFO",
  },
}
