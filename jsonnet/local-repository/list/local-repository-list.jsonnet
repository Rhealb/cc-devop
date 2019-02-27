{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "local-repository/local-repository-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "local-repository/local-repository-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
