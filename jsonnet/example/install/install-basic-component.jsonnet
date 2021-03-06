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
  local config_server = (import "config-server/list/config-server-list.jsonnet") + {
    _global_config: config,
  },
  local mysql = (import "mysql/list/mysql-list.jsonnet") + {
    _global_config: config,
  },
  local rabbitmq = (import "rabbitmq/list/rabbitmq-list.jsonnet") + {
    _global_config: config,
  },
  local redis = (import "redis/list/redis-list.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: config_server.items + mysql.items + rabbitmq.items + redis.items,
}
