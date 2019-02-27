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
  local ansible = (import "ansible/list/ansible-list.jsonnet") + {
    _global_config: config,
  },
  local audit = (import "audit/list/audit-list.jsonnet") + {
    _global_config: config,
  },
  local console = (import "console/list/console-list.jsonnet") + {
    _global_config: config,
  },
  local gitbook = (import "gitbook/list/gitbook-list.jsonnet") + {
    _global_config: config,
  },
  local gc = (import "gc/list/gc-list.jsonnet") + {
    _global_config: config,
  },
  local harbor = (import "harbor/list/harbor-list.jsonnet") + {
    _global_config: config,
  },
  local lmd = (import "lmd/list/lmd-list.jsonnet") + {
    _global_config: config,
  },
  local local_repository = (import "local-repository/list/local-repository-list.jsonnet") + {
    _global_config: config,
  },
  local log = (import "log/list/log-list.jsonnet") + {
    _global_config: config,
  },
  local metric = (import "metric/list/metric-list.jsonnet") + {
    _global_config: config,
  },
  local notification = (import "notification/list/notification-list.jsonnet") + {
    _global_config: config,
  },
  local scale_console = (import "scale-console/list/scale-console-list.jsonnet") + {
    _global_config: config,
  },
  local template = (import "template/list/template-list.jsonnet") + {
    _global_config: config,
  },
  local watch = (import "watch/list/watch-list.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: ansible.items + audit.items + console.items + gitbook.items + gc.items + harbor.items + lmd.items + local_repository.items
         + log.items + metric.items + notification.items + scale_console.items + template.items + watch.items,
}
