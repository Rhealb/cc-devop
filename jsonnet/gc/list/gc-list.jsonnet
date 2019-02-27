{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "gc/gc-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "gc/gc-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
