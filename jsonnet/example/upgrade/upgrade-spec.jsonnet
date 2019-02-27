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
  },
  local account = (import "account/list/account-list.jsonnet") + {
    _global_config: config,
  },
  local audit = (import "audit/list/audit-list.jsonnet") + {
    _global_config: config,
  },
  local backend = (import "backend/list/backend-list.jsonnet") + {
    _global_config: config,
  },
  local console = (import "console/list/console-list.jsonnet") + {
    _global_config: config,
  },
  local gitbook = (import "gitbook/list/gitbook-list.jsonnet") + {
    _global_config: config,
  },
  local gateway = (import "gateway/list/gateway-list.jsonnet") + {
    _global_config: config,
  },
  local gc = (import "gc/list/gc-list.jsonnet") + {
    _global_config: config,
  },
  local harbor = (import "harbor/list/harbor-list.jsonnet") + {
    _global_config: config,
  },
  local initializer = (import "initializer/list/initializer-list.jsonnet") + {
    _global_config: config,
  },
  local kubeorigin = (import "kubeorigin/list/kubeorigin-list.jsonnet") + {
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
  local storage = (import "storage/list/storage-list.jsonnet") + {
    _global_config: config,
  },
  local storage_listener = (import "storage-listener/list/storage-listener-list.jsonnet") + {
    _global_config: config,
  },
  local template = (import "template/list/template-list.jsonnet") + {
    _global_config: config,
  },
  local terminal = (import "terminal/list/terminal-list.jsonnet") + {
    _global_config: config,
  },
  local watch = (import "watch/list/watch-list.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: account.items + backend.items + audit.items + console.items + gateway.items + gc.items + gitbook.items
         + harbor.items + initializer.items + kubeorigin.items + log.items + metric.items + notification.items + storage.items
         + storage_listener.items + template.items + terminal.items + watch.items,
}
