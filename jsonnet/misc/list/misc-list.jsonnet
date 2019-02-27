{
  local config = import "global/config.jsonnet",
  _global_config:: config,
  local namespace = (import "misc/misc-namespace.jsonnet") + {
    _config: $._global_config,
  },
  local cephSecret = (import "misc/misc-ceph-secret.jsonnet") + {
    _config: $._global_config,
  },
  local timezoneConfigMap = (import "misc/timezone-cm.jsonnet") + {
    _config: $._global_config,
  },
  local timezonePodPreset = (import "misc/timezone-podpreset.jsonnet") + {
    _config: $._global_config,
  },
  kind: "List",
  apiVersion: "v1",
  items: [namespace] + (
    if $._global_config.ceph.enable then
      [cephSecret]
    else
      []
  ) + [timezoneConfigMap] + [timezonePodPreset],
}
