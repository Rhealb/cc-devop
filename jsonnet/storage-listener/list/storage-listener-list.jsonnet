{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "storage-listener/storage-listener-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "storage-listener/storage-listener-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
