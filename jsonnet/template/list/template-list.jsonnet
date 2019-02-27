{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "template/template-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "template/template-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
