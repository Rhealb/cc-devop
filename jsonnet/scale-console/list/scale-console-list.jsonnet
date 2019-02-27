{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "scale-console/scale-console-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "scale-console/scale-console-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
