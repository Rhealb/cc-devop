{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "log/log-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "log/log-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
