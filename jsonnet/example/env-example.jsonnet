{
  local config = import "../global/config.jsonnet",
  local backend = (import "../backend/backend-env.jsonnet") + {
    _global_config: config,
  },
  local account = (import "../account/account-env.jsonnet") + {
    _global_config: config,
  },
  local notification = (import "../notification/notification-env.jsonnet") + {
    _global_config: config,
  },
  local audit = (import "../audit/audit-env.jsonnet") + {
    _global_config: config,
  },
  local log = (import "../log/log-env.jsonnet") + {
    _global_config: config,
  },
  local metric = (import "../metric/metric-env.jsonnet") + {
    _global_config: config,
  },
  local template = (import "../template/template-env.jsonnet") + {
    _global_config: config,
  },
  local dependency_checker = (import "../dependency-checker/dependency-checker-env.jsonnet") + {
    _global_config: config,
  },
  "cc-backend-pro.yml": std.manifestYamlDoc(backend),
  "cc-account-pro.yml": std.manifestYamlDoc(account),
  "cc-notification-pro.yml": std.manifestYamlDoc(notification),
  "cc-audit-pro.yml": std.manifestYamlDoc(audit),
  "cc-log-pro.yml": std.manifestYamlDoc(log),
  "cc-metric-pro.yml": std.manifestYamlDoc(metric),
  "cc-template-pro.yml": std.manifestYamlDoc(template),
  "dependency-checker-pro.yml": std.manifestYamlDoc(dependency_checker),
}
