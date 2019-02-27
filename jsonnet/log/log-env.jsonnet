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
    redis: {
      password: $._global_config.confidential.redis.password,
      host: std.format("%s.%s", [
        $._global_config.redis.service,
        $._global_config.namespaces.console,
      ]),
      port: $._global_config.redis.port,
    },
  },
  elasticsearch: {
    clusterName: "elasticsearch",
    clusterHost: std.format("%s.%s", [
      $._global_config.elastic_search.service,
      $._global_config.namespaces.elastic_search,
    ]),
    clusterPort: $._global_config.elastic_search.port,
    needAuth: false,
    username: $._global_config.confidential.elastic_search.username,
    password: $._global_config.confidential.elastic_search.password,
    kubeletTableName: $._global_config.elastic_search.kubelet_table,
    kubeProxyTableName: $._global_config.elastic_search.kube_proxy_table,
    flanneldTableName: $._global_config.elastic_search.flanneld_table,
    clusterPrefix: $._global_config.global.cluster_name,
    "http-connect-timeout-millis": 180000,
    "http-read-timeout-millis": 180000,
    "http-write-timeout-millis": 180000,
    configUrl: std.format("http://%s.%s:%d", [
      $._global_config.log_archive.service,
      $._global_config.namespaces.log_archive,
      $._global_config.log_archive.port,
    ]),
  },
  cc: {
    backend: {
      username: $._global_config.confidential.keystone.username,
      url: std.format("http://%s.%s:%s/gw/be/api/v1", [
        $._global_config.gateway.service,
        $._global_config.namespaces.gateway,
        $._global_config.gateway.http_port,
      ]),
    },
  },
  logging: {
    level: {
      root: "WARN",
      "cc.log": "INFO",
    },
    file: "/var/log/cc-log.log",
  },
  enn: {
    security: {
      enable: true,
      receive: "LOG",
      "white-list-type": "normal",
      "white-list": "/api/v1/health:GET",
    },
    http: {
      "connect-timeout-millis": 30000,
      "read-timeout-millis": 60000,
      "write-timeout-millis": 60000,
    },
  },
}
