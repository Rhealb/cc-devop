(import "common/deployment.jsonnet") + {
  // config variables
  _config:: {},
  // override super variables of deployment.jsonnet
  // meta
  _meta_name:: $._config.ansible.service,
  _meta_namespace:: $._config.namespaces.console,
  _meta_app:: $._config.apps.console,
  // spec
  _spec_version:: $._config.global.version,
  _spec_registry:: $._config.registry.host,
  _spec_registry_port:: $._config.registry.port,
  _spec_registry_project:: $._config.registry.project,
  _spec_requests_cpu: $._config.resource.ansible.requests_cpu,
  _spec_requests_memory: $._config.resource.ansible.requests_memory,
  _spec_limits_cpu: $._config.resource.ansible.limits_cpu,
  _spec_limits_memory: $._config.resource.ansible.limits_memory,
  _spec_image_name:: $._config.ansible.image_name,
  _spec_probe_delay: $._config.resource.ansible.probe,
  _spec_envs:: [
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
    // kubernetes
    std.format("K8S_MASTER_HOST:%s.%s", [
      $._config.k8s.service,
      $._config.namespaces.k8s,
    ]),
    std.format("K8S_MASTER_PORT:%s", [
      $._config.k8s.port,
    ]),
    std.format("K8S_ADMIN_USERNAME:%s", [
      $._config.confidential.k8s.username,
    ]),
    std.format("K8S_ADMIN_PASSWORD:%s", [
      $._config.confidential.k8s.password,
    ]),
    "ENN_SECURITY_ENABLE:true",
    "CLUSTER_PREFIX:playbook",
    "ADD_NODE_PLAYBOOK:add-node.yml",
    "spring_profiles_active:prod",
  ],
  _spec_ports:: [
    std.format("ansible-port:%s", [
      $._config.ansible.port,
    ]),
  ],
  _spec_volume_mounts:: [
    std.format("%s:%s", [
      $._config.ansible.config_map.cluster_setting.name,
      $._config.ansible.config_map.cluster_setting.mount_path,
    ]),
    std.format("%s:%s/admin-key.pem:admin-key.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
    std.format("%s:%s/admin.pem:admin.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
    std.format("%s:%s/ca-key.pem:ca-key.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
    std.format("%s:%s/ca.pem:ca.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
    std.format("%s:%s/etcd-admin-key.pem:etcd-admin-key.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
    std.format("%s:%s/etcd-admin.pem:etcd-admin.pem", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.ansible.config_map.cluster_ssl.mount_path,
    ]),
  ],
  _spec_volumes:: [
    std.format("%s:%s:%s", [
      $._config.ansible.config_map.cluster_setting.name,
      $._config.configMap,
      $._config.ansible.config_map.cluster_setting.name,
    ]),
    std.format("%s:%s:%s", [
      $._config.ansible.config_map.cluster_ssl.name,
      $._config.configMap,
      $._config.ansible.config_map.cluster_ssl.name,
    ]),
  ],
}
