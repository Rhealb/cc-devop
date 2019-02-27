{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "kubeorigin/kubeorigin-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "kubeorigin/kubeorigin-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
