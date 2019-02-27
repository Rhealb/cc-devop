{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "gitbook/gitbook-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "gitbook/gitbook-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
