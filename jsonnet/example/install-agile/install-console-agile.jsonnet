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
  local backend = (import "backend/list/backend-list-legacy.jsonnet") + {
    _global_config: config,
  },
  local gateway = (import "gateway/list/gateway-list.jsonnet") + {
    _global_config: config,
  },
  local initializer = (import "initializer/list/initializer-list-legacy.jsonnet") + {
    _global_config: config,
  },
  local kubeorigin = (import "kubeorigin/list/kubeorigin-list-legacy.jsonnet") + {
    _global_config: config,
  },
  local terminal = (import "terminal/list/terminal-list-legacy.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: backend.items + gateway.items + initializer.items + kubeorigin.items
         + terminal.items,
}
