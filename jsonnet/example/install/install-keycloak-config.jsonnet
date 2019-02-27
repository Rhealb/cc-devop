{
  local global_config = import "example/config.jsonnet",
  local config = (import "global/config.jsonnet") + {
    audit_clear: global_config.audit_clear,
    ceph: global_config.ceph,
    confidential: global_config.confidential,
    global: global_config.global,
    keycloak_config: global_config.keycloak_config,
    misc: global_config.misc,
    namespaces: global_config.namespaces,
    node_ports: global_config.node_ports,
    nfs: global_config.nfs,
    registry: global_config.registry,
    replicas: global_config.replicas,
    resource: global_config.resource,
    s3: global_config.s3,
    scheduler: global_config.scheduler,
    storage_config: global_config.storage_config,
  },
  local kc_realm = (import "keycloak/realm.jsonnet") + {
    _global_config: config,
  },
  local kc_client_console = (import "keycloak/client-console.jsonnet") + {
    _global_config: config,
  },
  local kc_client_ennctl = (import "keycloak/client-ennctl.jsonnet") + {
    _global_config: config,
  },
  local kc_client_lmd = (import "keycloak/client-lmd.jsonnet") + {
    _global_config: config,
  },
  local kc_client_scale = (import "keycloak/client-scale-console.jsonnet") + {
    _global_config: config,
  },
  "kc-realm.json": kc_realm,
  "kc-client-console.json": kc_client_console,
  "kc-client-ennctl.json": kc_client_ennctl,
  "kc-client-lmd.json": kc_client_lmd,
  "kc-client-scale.json": kc_client_scale,
}
