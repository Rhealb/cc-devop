{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "initializer/initializer-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "initializer/initializer-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
