{
  local global_config = import "example/config.jsonnet",
  local config = (import "global/config.jsonnet") + {
    audit_clear: global_config.audit_clear,
    ceph: global_config.ceph,
    confidential: global_config.confidential,
    global: global_config.global,
    keycloak_config: global_config.keycloak_config,
    misc: global_config.misc,
    namespaces: global_config.namespaces,
    node_ports: global_config.node_ports,
    nfs: global_config.nfs,
    registry: global_config.registry,
    replicas: global_config.replicas,
    resource: global_config.resource,
    s3: global_config.s3,
    scheduler: global_config.scheduler,
    storage_config: global_config.storage_config,
  },
  local misc = (import "misc/list/misc-list.jsonnet") + {
    _global_config: config,
  },
  local config_server_storage = (import "config-server/list/config-server-misc-list.jsonnet") + {
    _global_config: config,
  },
  local mysql_storage = (import "mysql/list/mysql-storage-list.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: misc.items + config_server_storage.items + mysql_storage.items,
}
