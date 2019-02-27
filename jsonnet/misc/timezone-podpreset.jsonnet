{
  _config:: {},
  apiVersion: "settings.k8s.io/v1alpha1",
  kind: "PodPreset",
  metadata: {
    name: "timezone-beijing",
    namespace: $._config.namespaces.console,
  },
  spec: {
    env: [
      {
        name: "TZ",
        value: "Asia/Shanghai",
      },
    ],
    selector: {
      matchLabels: {
        X_DEFAULT_TIMEZONE: "beijing",
      },
    },
    volumeMounts: [
      {
        mountPath: "/etc/localtime",
        name: "timezone",
        subPath: "localtime",
      },
    ],
    volumes: [
      {
        configMap: {
          defaultMode: 420,
          name: "timezone-beijing",
        },
        name: "timezone",
      },
    ],
  },
}
