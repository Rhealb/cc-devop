{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "gateway/gateway-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "gateway/gateway-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
