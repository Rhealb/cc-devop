{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "terminal/terminal-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "terminal/terminal-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
