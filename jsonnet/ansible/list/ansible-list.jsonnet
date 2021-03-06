{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "ansible/ansible-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "ansible/ansible-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
