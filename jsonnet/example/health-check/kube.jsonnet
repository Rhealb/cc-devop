{
  _config:: {},
  apiVersion: "v1",
  kind: "Config",
  clusters: [
    {
      name: "k8s-cluster",
      cluster: {
        "insecure-skip-tls-verify": true,
        server: std.format("https://%s:6443", [
          $._config.global.public_vip,
        ]),
      },
    },
  ],
  users: [
    {
      name: "k8s-user",
      user: {
        username: $._config.confidential.k8s.username,
        password: $._config.confidential.k8s.password,
      },
    },
  ],
  contexts: [
    {
      name: "k8s-context",
      context: {
        cluster: "k8s-cluster",
        user: "k8s-user",
      },
    },
  ],
  "current-context": "k8s-context",
}
