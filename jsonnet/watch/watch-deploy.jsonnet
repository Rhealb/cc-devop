(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.watch.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.watch.requests_cpu,
  _spec_requests_memory: $._config.resource.watch.requests_memory,
  _spec_limits_cpu: $._config.resource.watch.limits_cpu,
  _spec_limits_memory: $._config.resource.watch.limits_memory,
  _spec_image_name:: $._config.watch.image_name,
  _spec_probe_delay: $._config.resource.watch.probe,
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
    //https://kubernetes.default:443/api/
    std.format("K8S_HEALTH_URL:https://%s.%s:%s/api/", [
      $._config.k8s.service,
      $._config.namespaces.k8s,
      $._config.k8s.port,
    ]),
    // es heatlth
    std.format("ES_HOST:%s.%s", [
      $._config.elastic_search.service,
      $._config.namespaces.elastic_search,
    ]),
    std.format("ES_PORT:%s", [
      $._config.elastic_search.port,
    ]),
    // k8s health
    std.format("STATUS_K8S_HOST:%s", [
      $._config.global.vip,
    ]),
    std.format("STATUS_K8S_USER:%s", [
      $._config.confidential.k8s.username,
    ]),
    std.format("STATUS_K8S_PWD:%s", [
      $._config.confidential.k8s.password,
    ]),
    // es health
    // http://pre1-esclient-ex.monitor-essential-service:9200/_cluster/state
    std.format("ES_HEALTH_URL:http://%s.%s:%s/_cluster/state", [
      $._config.elastic_search.service,
      $._config.namespaces.elastic_search,
      $._config.elastic_search.port,
    ]),
    // opentsdb health
    // http://pre1-opentsdb.monitor-essential-service:4242/api
    std.format("OPENTSDB_HEALTH_URL:http://%s.%s:%s/api", [
      $._config.opentsdb.service,
      $._config.namespaces.opentsdb,
      $._config.opentsdb.port,
    ]),
    // ceph health
    // http://ceph-restapi.ceph:5000/api/v0.1/health
    std.format("CEPH_HEALTH_URL:http://%s.%s:%s/api/v0.1/health", [
      $._config.ceph.health.service,
      $._config.namespaces.ceph,
      $._config.ceph.health.port,
    ]),
    // PROMETHEUS_HEALTH_URL
    // http://prometheus-engine.monitor-application:9090
    std.format("PROMETHEUS_HEALTH_URL:http://%s.%s:%s", [
      $._config.prometheus.health.service,
      $._config.namespaces.prometheus,
      $._config.prometheus.health.port,
    ]),
    // CEPH_MON_HOST
    std.format("CEPH_MON_HOST:%s", [
      $._config.ceph.monitor_urls,
    ]),
    // CC_ACCOUNT_HEALTH_URL
    // http://gateway.system-tools:8810/gw/ac/api/v1/health
    std.format("CC_ACCOUNT_HEALTH_URL:http://%s.%s:%s/gw/ac/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_AUDIT_HEALTH_URL:http://%s.%s:%s/gw/ad/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_BACKEND_HEALTH_URL:http://%s.%s:%s/gw/be/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_GATEWAY_HEALTH_URL:http://%s.%s:%s/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_KUBEORIGIN_HEALTH_URL:http://%s.%s:%s/gw/ko/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_LOG_HEALTH_URL:http://%s.%s:%s/gw/lo/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_METRIC_HEALTH_URL:http://%s.%s:%s/gw/mt/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_NOTIFICATION_HEALTH_URL:http://%s.%s:%s/gw/nt/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_STORAGE_HEALTH_URL:http://%s.%s:%s/gw/st/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_TEMPLATE_HEALTH_URL:http://%s.%s:%s/gw/tp/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_INITIALIZER_HEALTH_URL:http://%s.%s:%s/gw/in/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_HARBOR_HEALTH_URL:http://%s.%s:%s/gw/hb/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("CC_CONSOLE_HEALTH_URL:http://%s.%s:%s", [
      $._config.console.service,
      $._config.namespaces.console,
      $._config.console.port,
    ]),
    std.format("CC_TERMINAL_HEALTH_URL:http://%s.%s:%s/api/v1/health", [
      $._config.terminal.service,
      $._config.namespaces.console,
      $._config.terminal.port,
    ]),
    std.format("CC_WATCH_HEALTH_URL:http://%s.%s:%s/gw/wt/api/v1/health", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("USER:%s", [
      $._config.confidential.keystone.username,
    ]),
    std.format("PASSWORD:%s", [
      $._config.confidential.keystone.password,
    ]),
    std.format("BACKEND_URL:http://%s.%s:%s/gw/be/api/v1", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("ACCOUNT_URL:http://%s.%s:%s/gw/ac/api/v1", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("AUTH_URL:http://%s.%s:%s/gw/kc/auth/realms/console-sso/protocol/openid-connect/token", [
      $._config.gateway.service,
      $._config.namespaces.gateway,
      $._config.gateway.http_port,
    ]),
    std.format("NAMESPACE:%s", [
      $._config.namespaces.console,
    ]),
    std.format("STORAGE_NAME:%s", [
      $._config.misc.mysql_storage,
    ]),
    std.format("CONSOLE_DOC_HEALTH_URL:http://%s.%s:%s", [
      $._config.gitbook.service,
      $._config.namespaces.console,
      $._config.gitbook.port,
    ]),
    // timeouts
    "CONNECT_TIMEOUT:4",
    "READ_TIMEOUT:2",
    "WRITE_TIMEOUT:2",
    "ENN_SECURITY_ENABLE:true",
    "spring_profiles_active:prod,status_prod",
    "STORAGE_LIMIT:0.9",
    "TABLE_LIMIT:0.5",
    "CLEAR_PERCENT:0.05",
  ],
  _spec_envs_from_key:: [
    std.format("CONFIG_SERVER_PASSWORD:%s:%s", [
      $._config.config_server.secret.key,
      $._config.config_server.secret.name,
    ]),
  ],
  _spec_ports:: [
    std.format("watch-port:%s", [
      $._config.watch.port,
    ]),
  ],
}
