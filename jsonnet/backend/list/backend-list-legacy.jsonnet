{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "backend/backend-deploy-legacy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "backend/backend-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
