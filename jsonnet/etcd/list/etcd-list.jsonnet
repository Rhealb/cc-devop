{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "etcd/etcd-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "etcd/etcd-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
