{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "harbor/harbor-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "harbor/harbor-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
