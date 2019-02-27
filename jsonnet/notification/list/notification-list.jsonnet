{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "notification/notification-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "notification/notification-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
