{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "console/console-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "console/console-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
