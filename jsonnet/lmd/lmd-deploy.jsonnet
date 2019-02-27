(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.lmd.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.lmd,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.lmd.requests_cpu,
  _spec_requests_memory: $._config.resource.lmd.requests_memory,
  _spec_limits_cpu: $._config.resource.lmd.limits_cpu,
  _spec_limits_memory: $._config.resource.lmd.limits_memory,
  _spec_image_name:: $._config.lmd.image_name,
  _spec_probe_delay: $._config.resource.lmd.probe,
  _spec_envs:: [
    std.format("AUTH_URL:http://%s:%s/gw/ac/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("BACKEND_URL:http://%s:%s/gw/be/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("METRIC_URL:http://%s:%s/gw/mt/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("KUBE_ORIGIN_URL:http://%s:%s/gw/ko/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("LOG_URL:http://%s:%s/gw/lo/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("cluster_name:%s", [
      $._config.global.cluster_name,
    ]),
    std.format("KEYCLOAK_CLIENT:%s", [
      $._config.keycloak_config.client.lmd,
    ]),
    std.format("KEYCLOAK_REALM:%s", [
      $._config.keycloak_config.realm,
    ]),
    std.format("KEYCLOAK_REDIRECT:http://%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.lmb,
    ]),
    std.format("KEYCLOAK_URL:http://%s:%s/auth", [
      $._config.global.public_vip,
      $._config.node_ports.keycloak,
    ]),
  ],
  _spec_ports:: [
    std.format("lmd-port:%s", [
      $._config.lmd.port,
    ]),
  ],
}
