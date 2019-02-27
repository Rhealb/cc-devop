{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "storage/storage-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "storage/storage-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
