{
  // config variables
  _global_config:: {},
  // content
  opentsdb: {
    url: std.format("http://%s.%s:%s/api", [
      $._global_config.opentsdb.service,
      $._global_config.namespaces.opentsdb,
      $._global_config.opentsdb.port,
    ]),
  },
  metric: {
    "http-connect-timeout-millis": 180000,
    "http-read-timeout-millis": 180000,
    "http-write-timeout-millis": 180000,
  },
  logging: {
    level: {
      root: "WARN",
      "cc.metric": "INFO",
    },
    file: "/var/log/cc-metric.log",
  },
  backend: {
    url: std.format("http://%s.%s:%s/gw/be/api/v1", [
      $._global_config.gateway.service,
      $._global_config.namespaces.gateway,
      $._global_config.gateway.http_port,
    ]),
  },
  enn: {
    security: {
      enable: true,
      receive: "METRIC",
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
