{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [
    (import "keycloak/keycloak-deploy.jsonnet") + {
      _config: $._global_config,
    },
  ] + [
    (import "keycloak/keycloak-svc.jsonnet") + {
      _config: $._global_config,
    },
  ],
}
