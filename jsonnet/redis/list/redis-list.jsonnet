{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "redis/redis-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "redis/redis-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
