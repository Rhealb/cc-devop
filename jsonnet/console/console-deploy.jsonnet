(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.console.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.console.requests_cpu,
  _spec_requests_memory: $._config.resource.console.requests_memory,
  _spec_limits_cpu: $._config.resource.console.limits_cpu,
  _spec_limits_memory: $._config.resource.console.limits_memory,
  _spec_image_name:: $._config.console.image_name,
  _spec_probe_delay: $._config.resource.console.probe,
  _spec_envs:: [
    "NODE_ENV:production",
    std.format("AUDIT_URL:http://%s:%s/gw/ad/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("AUTH_URL:http://%s:%s/gw/ac/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("BACKEND_URL:http://%s:%s/gw/be/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("DEPENDENCY_URL:http://%s:%s/gw/dp/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("DOC_URL:http://%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.gitbook,
    ]),
    std.format("GATEWAY_URL:http://%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("HARBOR_URL:http://%s:%s/gw/hb/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("INITIAL_URL:http://%s:%s/gw/in/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("KUBE_ORIGIN_URL:http://%s:%s/gw/ko/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("LMB_URL:%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.lmb,
    ]),
    std.format("LOG_URL:http://%s:%s/gw/lo/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("METRIC_URL:http://%s:%s/gw/mt/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("NOTIFICATION_URL:http://%s:%s/gw/nt/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("STORAGE_URL:http://%s:%s/gw/st/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("TEMPLATE_URL:http://%s:%s/gw/tp/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("TERMINAL_URL:ws://%s:%s/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.terminal,
    ]),
    std.format("WATCH_URL:http://%s:%s/gw/wt/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("KEYCLOAK_CLIENT:%s", [
      $._config.keycloak_config.client.console,
    ]),
    std.format("KEYCLOAK_REALM:%s", [
      $._config.keycloak_config.realm,
    ]),
    std.format("KEYCLOAK_REDIRECT:http://%s/#/console/namespace-list?redirect=app", [
      $._config.global.console_domain_name,
    ]),
    std.format("KEYCLOAK_URL:http://%s:%s/auth", [
      $._config.global.public_vip,
      $._config.node_ports.keycloak,
    ]),
    std.format("TITLE_CN:%s", [
      $._config.global.title_cn,
    ]),
    std.format("TITLE_EN:%s", [
      $._config.global.title_en,
    ]),
    std.format("VERSION:%s", [
      $._config.global.version,
    ]),
  ],
  _spec_ports:: [
    std.format("console-port:%s", [
      $._config.console.port,
    ]),
  ],
}
