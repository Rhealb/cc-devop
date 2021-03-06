{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "rabbitmq/rabbitmq-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "rabbitmq/rabbitmq-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
