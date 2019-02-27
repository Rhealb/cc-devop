{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "mysql/mysql-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "mysql/mysql-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
