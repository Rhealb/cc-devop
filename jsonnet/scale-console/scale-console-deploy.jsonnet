(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.scale_console.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.scale_console.requests_cpu,
  _spec_requests_memory: $._config.resource.scale_console.requests_memory,
  _spec_limits_cpu: $._config.resource.scale_console.limits_cpu,
  _spec_limits_memory: $._config.resource.scale_console.limits_memory,
  _spec_image_name:: $._config.scale_console.image_name,
  _spec_probe_delay: $._config.resource.scale_console.probe,
  _spec_envs:: [
    std.format("AUTH_URL:http://%s:%s/gw/ac/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("BACKEND_URL:http://%s:%s/gw/be/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("KUBE_ORIGIN_URL:http://%s:%s/gw/ko/api/v1", [
      $._config.global.public_vip,
      $._config.node_ports.gateway_http,
    ]),
    std.format("KEYCLOAK_CLIENT:%s", [
      $._config.keycloak_config.client.scale,
    ]),
    std.format("KEYCLOAK_REALM:%s", [
      $._config.keycloak_config.realm,
    ]),
    std.format("KEYCLOAK_REDIRECT:http://%s:%s", [
      $._config.global.public_vip,
      $._config.node_ports.scale,
    ]),
    std.format("KEYCLOAK_URL:http://%s:%s/auth", [
      $._config.global.public_vip,
      $._config.node_ports.keycloak,
    ]),
    std.format("VERSION:%s", [
      $._config.global.version,
    ]),
  ],
  _spec_ports:: [
    std.format("scale-port:%s", [
      $._config.scale_console.port,
    ]),
  ],
}
