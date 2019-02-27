(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.mongo.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.mongo.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.mongo.requests_cpu,
  _spec_requests_memory: $._config.resource.mongo.requests_memory,
  _spec_limits_cpu: $._config.resource.mongo.limits_cpu,
  _spec_limits_memory: $._config.resource.mongo.limits_memory,
  _spec_probe_enabled: false,
  _spec_image_name:: $._config.mongo.image_name,
  _spec_ports:: [
    std.format("mongo-port:%s", [
      $._config.mongo.port,
    ]),
  ],
}
