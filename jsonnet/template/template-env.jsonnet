{
  // config variables
  _global_config:: {},
  // content
  spring: {
    data: {
      mongodb: {
        uri: std.format("mongodb://%s.%s:%s/%s", [
          $._global_config.mongo.service,
          $._global_config.namespaces.console,
          $._global_config.mongo.port,
          $._global_config.mongo.template_db,
        ]),
      },
    },
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
  },
  cc: {
    dependency: {
      checker: std.format("http://%s.%s:%s/gw/dp/api/v1", [
        $._global_config.gateway.service,
        $._global_config.namespaces.gateway,
        $._global_config.gateway.http_port,
      ]),
    },
    storage: {
      url: std.format("http://%s.%s:%s/gw/st/api/v1", [
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
  },
  logging: {
    level: {
      root: "INFO",
      "cc.template": "INFO",
    },
    file: "/var/log/cc-backend.log",
  },
  security: {
    enableFilter: true,
  },
  jsonnet: {
    tempDir: "/tmp/",
    cephaddress: std.join(",", $._global_config.ceph.monitors_without_port),
    harbor: std.format("%s:%s", [
      $._global_config.registry.host,
      $._global_config.registry.port,
    ]),
    vip: $._global_config.global.public_vip,
    ldapport: 29015,
    cephfskeyring: $._global_config.ceph.admin_keyring,
    location: $._global_config.global.location,
  },
  kafka: {
    "bootstrap-servers": $._global_config.kafka.url,
    consumer: {
      "group-id": "template-dev",
    },
    topic: {
      health: "monitor_topic",
      metrics: "metrics",
      summary: "summary",
    },
  },
  redis: {
    topic: "agent",
    password: $._global_config.confidential.redis.password,
    host: std.format("%s.%s", [
      $._global_config.redis.service,
      $._global_config.namespaces.console,
    ]),
    port: $._global_config.redis.port,
  },
  createApp: {
    timeout: {
      minutes: 20,
    },
  },
  upload: {
    templates: $._global_config.misc.upload_template,
  },
  vip: $._global_config.global.public_vip,
}
