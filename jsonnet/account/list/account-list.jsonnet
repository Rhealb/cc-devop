{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "account/account-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "account/account-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
