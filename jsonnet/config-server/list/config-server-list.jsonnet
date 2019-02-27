{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "config-server/config-server-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "config-server/config-server-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
