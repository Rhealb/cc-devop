// Deployment template
(import "meta.jsonnet") + {
  // global variables
  _spec_version:: "tbd",
  _spec_registry:: "127.0.0.1",
  _spec_registry_port:: "29006",
  _spec_registry_project:: "console",
  _spec_image_name:: "tbd",
  _spec_replicas:: 1,
  _spec_name:: $._meta_name,
  _spec_app:: $._meta_app,
  _spec_container_name:: $._meta_name,
  _spec_args:: [],
  _spec_envs:: [],
  _spec_envs_from_key:: [],
  _spec_volume_mounts:: [],
  _spec_volumes:: [],
  _spec_ports:: [],
  _spec_requests_cpu:: "0",
  _spec_requests_memory:: "0",
  _spec_limits_cpu:: "0",
  _spec_limits_memory:: "0",
  _spec_privileged:: false,
  _spec_strategy:: "RollingUpdate",
  _spec_image_pull_policy:: "Always",
  _spec_privilege:: false,
  _spec_probe_enabled:: true,
  _spec_probe_delay:: 300,
  _spec_probe_period:: 15,
  _spec_probe_retry:: 3,
  _spec_probe_timeout:: 10,
  _spec_image:: std.format("%s:%s/%s/%s:%s", [
    $._spec_registry,
    $._spec_registry_port,
    $._spec_registry_project,
    $._spec_image_name,
    $._spec_version,
  ]),
  // override super global variables

  apiVersion: "extensions/v1beta1",
  kind: "Deployment",
  spec: {
    selector: {
      matchLabels: {
        X_APP: $._spec_app,
        name: $._spec_name,
      },
    },
    strategy: {
      type: $._spec_strategy,
      rollingUpdate: {
        maxUnavailable: 0,
        maxSurge: 1,
      },
    },
    replicas: $._spec_replicas,
    template: {
      metadata: {
        labels: {
          X_DEFAULT_TIMEZONE: "beijing",
          X_APP: $._spec_app,
          name: $._spec_name,
        },
      },
      spec: {
        containers: [
          {
            image: $._spec_image,
            imagePullPolicy: $._spec_image_pull_policy,
            name: $._spec_container_name,
            [if std.length($._spec_args) > 0 then "args"]: $._spec_args,
            local evaluate_env(arr) = {
              name: arr[0],
              value: arr[1],
              type: "value",
            },
            local evaluate_env_from_key(arr) = {
              name: arr[0],
              key: arr[1],
              value: arr[2],
              type: "secret",
            },
            local env_list = std.map(evaluate_env, [std.splitLimit(env, ":", 1) for env in $._spec_envs]),
            local evn_from_key_list = std.map(evaluate_env_from_key, [std.splitLimit(env, ":", 2) for env in $._spec_envs_from_key]),
            [if std.length($._spec_envs) + std.length($._spec_envs_from_key) > 0 then "env"]: [
              (
                if e.type == "value" then
                  {
                    name: e.name,
                    value: e.value,
                  }
                else
                  {
                    name: e.name,
                    valueFrom: {
                      secretKeyRef: {
                        key: e.key,
                        name: e.value,
                      },
                    },
                  }
              )
              for e in std.flattenArrays([env_list, evn_from_key_list])
            ],
            local port_list = [std.splitLimit(port, ":", 1) for port in $._spec_ports],
            [if std.length($._spec_ports) > 0 then "ports"]: [
              {
                name: port[0],
                containerPort: std.parseInt(port[1]),
              }
              for port in port_list
            ],
            local volume_mount_list = [std.split(volume_mount, ":") for volume_mount in $._spec_volume_mounts],
            [if std.length($._spec_volume_mounts) > 0 then "volumeMounts"]: [
              if std.length(vm) > 2 then
                {
                  name: vm[0],
                  mountPath: vm[1],
                  subPath: vm[2],
                }
              else
                {
                  name: vm[0],
                  mountPath: vm[1],
                }
              for vm in volume_mount_list
            ],
            resources: {
              requests: {
                memory: $._spec_requests_memory,
                cpu: $._spec_requests_cpu,
              },
              limits: {
                memory: $._spec_limits_memory,
                cpu: $._spec_limits_cpu,
              },
            },
            [if $._spec_privilege then "securityContext"]: {
              privileged: $._spec_privilege,
            },
            [if $._spec_probe_enabled then "livenessProbe"]: {
              tcpSocket: {
                port: std.parseInt(port_list[0][1]),
              },
              initialDelaySeconds: $._spec_probe_delay,
              periodSeconds: $._spec_probe_period,
              timeoutSeconds: $._spec_probe_timeout,
              successThreshold: 1,
              failureThreshold: $._spec_probe_retry,
            },
            [if $._spec_probe_enabled then "readinessProbe"]: {
              tcpSocket: {
                port: std.parseInt(port_list[0][1]),
              },
              initialDelaySeconds: $._spec_probe_delay,
              periodSeconds: $._spec_probe_period,
              timeoutSeconds: $._spec_probe_timeout,
              successThreshold: 1,
              failureThreshold: $._spec_probe_retry,
            },
          },
        ],
        local volume_list = [std.splitLimit(volume, ":", 2) for volume in $._spec_volumes],
        [if std.length($._spec_volumes) > 0 then "volumes"]: [
          {
            name: volume[0],
            [volume[1]]:
              if volume[1] == "hostPath" then
                {
                  path: volume[2],
                }
              else if volume[1] == "persistentVolumeClaim" then
                {
                  claimName: volume[2],
                }
              else if volume[1] == "configMap" then
                {
                  name: volume[2],
                }
              else
                error "not support volume type",
          }
          for volume in volume_list
        ],
      },
    },
  },
}
