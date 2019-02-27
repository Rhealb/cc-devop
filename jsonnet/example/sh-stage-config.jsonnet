{
  audit_clear: {
    storage_limit: 0.9,
    table_limit: 0.5,
    clear_percent: 0.05,
  },
  global: {
    vip: "10.19.140.200",
    public_vip: "10.19.140.200",
    title_cn: "新智新氦应用平台",
    title_en: "Helium+ Data Platform",
    cluster_name: "shanghai",
    console_domain_name: "10.19.140.200:29000",
    auth_enable: "true",
    commandline_enable: "false",
    version: "stg",
    location: "shanghai",
  },
  keycloak_config: {
    realm: "console-sso",
    client: {
      console: "console-stage",
      ennctl: "ennctl",
      lmd: "lmd",
      scale: "scale-console",
    },
  },
  node_ports: {
    console: "29000",
    gateway_https: "29001",
    gateway_http: "29002",
    gitbook: "29004",
    harbor: "29006",
    keycloak: "29270",
    lmb: "29005",
    rgw: "29100",
    scale: "29021",
    terminal: "29003",
  },
  confidential: {
    elastic_search: {
      username: "elastic",
      password: "changeme",
    },
    harbor: {
      username: "admin",
      password: "enncloud",
    },
    keycloak: {
      username: "root",
      password: "root",
    },
    keystone: {
      username: "console",
      password: "d2FuZzE5OTMwNDEx",
    },
    k8s: {
      username: "zhtsC1002",
      password: "zhtsC1002",
    },
    mysql: {
      username: "root",
      password: "root",
    },
    rabbitmq: {
      username: "admin",
      password: "enn123456",
    },
    redis: {
      username: "admin",
      password: "enn123456",
    },
    appautoscale: {
      username: "zhtsC1002",
      password: "zhtsC1002",
    },
    scheduler: {
      username: "zhtsC1002",
      password: "zhtsC1002",
    },
  },
  replicas: {
    gateway: 1,
    backend: 1,
  },
  ceph: {
    enable: true,
    health: {
      service: "ceph-rest",
      port: "5000",
    },
    admin_keyring: "AQBtANlX3yKnGBAAc4aDNDazD9QITzoV+0OsGA==",
    admin_user: "admin",
    monitors_without_port: ["10.19.137.144", "10.19.137.145", "10.19.137.146"],
    monitors: ["10.19.137.144:6789", "10.19.137.145:6789", "10.19.137.146:6789"],
    monitor_urls: "10.19.137.144:6789,10.19.137.145:6789,10.19.137.146:6789",
  },
  nfs: {
    enable: false,
    server: "nfs.dev.enndata.cn",
    server_dir: "/share-emh0YW5nc2g",
    args: "",
  },
  s3: {
    enable: true,
    host: "10.19.140.200:29100",
    access_key: "MYCIH9BX7QG8XTDEG7FR",
    secret_key: "7AK4vGhK5O1OlsLypdQO8JiCEcupJtLcLWCNJ7aD",
    app_id: "123456",
  },
  namespaces: {
    console: "cc-itg",
    ldap: "system-tools",
    keystone: "system-tools",
    gateway: "system-tools",
    keycloak: "cc-itg",
    k8s: "default",
    kube_system: "kube-system",
    prometheus: "monitor-system-alert",
    ceph: "ceph",
    elastic_search: "monitor-essential-service",
    log_archive: "monitor-system-log",
    opentsdb: "monitor-essential-service",
  },
  registry: {
    host: "127.0.0.1",
    port: 29006,
    project: "console",
  },
  scheduler: {
    host: "10.19.137.140",
    port: "8843",
  },
  resource: {
    account: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    audit: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    backend: {
      requests_cpu: "300m",
      requests_memory: "1400Mi",
      limits_cpu: "1",
      limits_memory: "3Gi",
      probe: 240,
    },
    config_server: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    console: {
      requests_cpu: "100m",
      requests_memory: "128Mi",
      limits_cpu: "100m",
      limits_memory: "128Mi",
      probe: 30,
    },
    dependency_checker: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "300m",
      limits_memory: "1Gi",
      probe: 500,
    },
    etcd: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
    },
    harbor: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    initializer: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    gateway: {
      requests_cpu: "100m",
      requests_memory: "1300Mi",
      limits_cpu: "800m",
      limits_memory: "2Gi",
      probe: 240,
    },
    gc: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    gitbook: {
      requests_cpu: "100m",
      requests_memory: "128Mi",
      limits_cpu: "100m",
      limits_memory: "128Mi",
    },
    keycloak: {
      requests_cpu: "100m",
      requests_memory: "1Gi",
      limits_cpu: "800m",
      limits_memory: "2Gi",
      probe: 240,
    },
    kubeorigin: {
      requests_cpu: "100m",
      requests_memory: "1Gi",
      limits_cpu: "800m",
      limits_memory: "2Gi",
      probe: 240,
    },
    log: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    lmd: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
      probe: 30,
    },
    metric: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    mongo: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "200m",
      limits_memory: "256Mi",
    },
    mysql: {
      requests_cpu: "100m",
      requests_memory: "2Gi",
      limits_cpu: "400m",
      limits_memory: "4Gi",
    },
    notification: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    rabbitmq: {
      requests_cpu: "200m",
      requests_memory: "256Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
    },
    redis: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
    },
    scale_console: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
      probe: 30,
    },
    storage: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    storage_listener: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1500Mi",
      probe: 300,
    },
    watch: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    template: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
    terminal: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "800m",
      limits_memory: "1600Mi",
      probe: 240,
    },
  },
  storage_config: {
    mysql: "rbd",
    mongo: "rbd",
    config_server: "cephfs",
  },
  misc: {
    mysql_storage: "cc-mysql-data",
    upload_template: false,
    tf_url: "tf-prod-backend.tensor-system:8821",
    keycloak_storage_id: "407b89d5-2186-4f6e-a0cb-1987583d7cd7",
  },
}
