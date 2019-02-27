{
  local config = import "global/config.jsonnet",
  local namespace = (import "misc/misc-namespace.jsonnet") + {
    _config: $._global_config,
  },
  local timezoneConfigMap = (import "misc/timezone-cm.jsonnet") + {
    _config: $._global_config,
  },
  local timezonePodPreset = (import "misc/timezone-podpreset.jsonnet") + {
    _config: $._global_config,
  },
  _global_config:: config,
  kind: "List",
  apiVersion: "v1",
  items: [namespace] + [timezoneConfigMap] + [timezonePodPreset],
}
