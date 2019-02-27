{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "watch/watch-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "watch/watch-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
