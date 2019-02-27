{
  // config variables
  _global_config:: {},
  // content
  spring: {
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
  etcd: {
    address: std.format("http://%s.%s:%d", [
      $._global_config.etcd.service,
      $._global_config.namespaces.console,
      $._global_config.etcd.server_port,
    ]),
  },
  logging: {
    level: {
      root: "INFO",
      "cc.template": "DEBUG",
    },
    file: "/var/log/dependency-checker.log",
  },
  enn: {
    security: {
      enable: false,
      receive: "DEPENDENCY_CHECKER",
    },
    http: {
      "connect-timeout-millis": 30000,
      "read-timeout-millis": 60000,
      "write-timeout-millis": 60000,
    },
  },
}
