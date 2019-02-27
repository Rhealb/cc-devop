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
  local backend = (import "backend/backend-env.jsonnet") + {
    _global_config: config,
  },
  local account = (import "account/account-env.jsonnet") + {
    _global_config: config,
  },
  local notification = (import "notification/notification-env.jsonnet") + {
    _global_config: config,
  },
  local audit = (import "audit/audit-env.jsonnet") + {
    _global_config: config,
  },
  local log = (import "log/log-env.jsonnet") + {
    _global_config: config,
  },
  local metric = (import "metric/metric-env.jsonnet") + {
    _global_config: config,
  },
  local template = (import "template/template-env.jsonnet") + {
    _global_config: config,
  },
  "cc-backend-pro.yml": std.manifestYamlDoc(backend),
  "cc-account-pro.yml": std.manifestYamlDoc(account),
  "cc-notification-pro.yml": std.manifestYamlDoc(notification),
  "cc-audit-pro.yml": std.manifestYamlDoc(audit),
  "cc-log-pro.yml": std.manifestYamlDoc(log),
  "cc-metric-pro.yml": std.manifestYamlDoc(metric),
  "cc-template-pro.yml": std.manifestYamlDoc(template),
}
