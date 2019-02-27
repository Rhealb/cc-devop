{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "metric/metric-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "metric/metric-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
