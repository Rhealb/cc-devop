{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "mongo/mongo-pv.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "mongo/mongo-pvc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
