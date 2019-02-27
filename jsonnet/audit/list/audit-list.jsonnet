{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "audit/audit-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "audit/audit-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
