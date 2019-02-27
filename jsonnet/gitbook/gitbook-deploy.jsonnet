(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.gitbook.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.gitbook.requests_cpu,
  _spec_requests_memory: $._config.resource.gitbook.requests_memory,
  _spec_limits_cpu: $._config.resource.gitbook.limits_cpu,
  _spec_limits_memory: $._config.resource.gitbook.limits_memory,
  _spec_image_name:: $._config.gitbook.image_name,
  _spec_ports:: [
    std.format("gitbook-port:%s", [
      $._config.gitbook.port,
    ]),
  ],
}
