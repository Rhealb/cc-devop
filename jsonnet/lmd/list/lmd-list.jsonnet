{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "lmd/lmd-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "lmd/lmd-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
