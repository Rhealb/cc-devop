(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.etcd.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.etcd.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.etcd.requests_cpu,
  _spec_requests_memory: $._config.resource.etcd.requests_memory,
  _spec_limits_cpu: $._config.resource.etcd.limits_cpu,
  _spec_limits_memory: $._config.resource.etcd.limits_memory,
  _spec_image_name:: $._config.etcd.image_name,
  _spec_args:: [
    "--name",
    "cc-etcd",
    "--initial-advertise-peer-urls",
    "http://cc-etcd:2380",
    "--listen-peer-urls",
    "http://0.0.0.0:2380",
    "--listen-client-urls",
    "http://0.0.0.0:2379",
    "--advertise-client-urls",
    "http://cc-etcd:2379",
    "--initial-cluster-token",
    "etcd-cluster-1",
    "--initial-cluster",
    "cc-etcd=http://cc-etcd:2380",
    "--initial-cluster-state",
    "new",
  ],
  _spec_probe_enabled: false,
  _spec_ports:: [
    std.format("server-port:%s", [
      $._config.etcd.server_port,
    ]),
    std.format("client-port:%s", [
      $._config.etcd.client_port,
    ]),
  ],
}
