{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "config-server/config-server-pv.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "config-server/config-server-pvc.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "config-server/config-server-secret.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
