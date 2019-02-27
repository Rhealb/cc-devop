{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "dependency-checker/dependency-checker-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "dependency-checker/dependency-checker-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
