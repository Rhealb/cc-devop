{
  audit_clear: {
    storage_limit: 0.9,
    table_limit: 0.5,
    clear_percent: 0.05,
  },
  global: {
    vip: "10.19.248.200",
    public_vip: "10.19.248.200",
    title_cn: "新智新氦应用平台",
    title_en: "Helium+ Data Platform",
    cluster_name: "yancheng",
    console_domain_name: "console.native.enndata.cn",
    auth_enable: "true",
    commandline_enable: "true",
    version: "1.47",
    location: "yancheng",
  },
  keycloak_config: {
    realm: "console-sso",
    client: {
      console: "console",
      ennctl: "ennctl",
      lmd: "lmd",
      scale: "scale-console",
    },
  },
  node_ports: {
    console: "32206",
    gateway_https: "32209",
    gateway_http: "32210",
    gitbook: "29004",
    harbor: "29006",
    keycloak: "29270",
    lmb: "29005",
    rgw: "29100",
    scale: "29021",
    terminal: "32218",
  },
  confidential: {
    elastic_search: {
      username: "elastic",
      password: "changeme",
    },
    harbor: {
      username: "admin",
      password: "zhtsC1002",
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
      username: "console",
      password: "Y29uc29sZV9wYXNzd29yZA==",
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
    gateway: 3,
    backend: 2,
  },
  ceph: {
    enable: true,
    health: {
      service: "ceph-restapi",
      port: "5000",
    },
    admin_keyring: "AQBBMhhYmGOoCRAAQjTmpadtSeaUGcu8FbtQlA==",
    admin_user: "admin",
    monitors_without_port: ["10.19.248.27", "10.19.248.28", "10.19.248.29", "10.19.248.30", "10.19.248.31"],
    monitors: ["10.19.248.27:6789", "10.19.248.28:6789", "10.19.248.29:6789", "10.19.248.30:6789", "10.19.248.31:6789"],
    monitor_urls: "10.19.248.27:6789,10.19.248.28:6789,10.19.248.29:6789,10.19.248.30:6789,10.19.248.31:6789",
  },
  nfs: {
    enable: false,
    server: "nfs.dev.enndata.cn",
    server_dir: "/share-emh0YW5nc2g",
    args: "",
  },
  s3: {
    enable: true,
    host: "10.19.248.200:29100",
    access_key: "8HR29D8NPI317B9TWQ53",
    secret_key: "yUegHoQhkhAmyEqODyBQKUimKkALQtt7W3GyOQZl",
    app_id: "123456",
  },
  namespaces: {
    console: "cc-dev",
    ldap: "system-tools",
    keystone: "system-tools",
    gateway: "system-tools",
    keycloak: "cc-dev",
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
    host: "10.19.248.26",
    port: "8843",
  },
  resource: {
    account: {
      requests_cpu: "300m",
      requests_memory: "500Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
      probe: 300,
    },
    audit: {
      requests_cpu: "300m",
      requests_memory: "500Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
      probe: 300,
    },
    backend: {
      requests_cpu: "2",
      requests_memory: "2Gi",
      limits_cpu: "3",
      limits_memory: "4Gi",
      probe: 100,
    },
    config_server: {
      requests_cpu: "1",
      requests_memory: "1Gi",
      limits_cpu: "2",
      limits_memory: "2Gi",
      probe: 30,
    },
    console: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "300m",
      limits_memory: "1Gi",
      probe: 30,
    },
    dependency_checker: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "600m",
      limits_memory: "1600Mi",
      probe: 400,
    },
    etcd: {
      requests_cpu: "200m",
      requests_memory: "256Mi",
      limits_cpu: "200m",
      limits_memory: "256Mi",
    },
    harbor: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "800Mi",
      probe: 300,
    },
    initializer: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "1Gi",
      probe: 400,
    },
    gateway: {
      requests_cpu: "1",
      requests_memory: "2Gi",
      limits_cpu: "3",
      limits_memory: "4Gi",
      probe: 30,
    },
    gc: {
      requests_cpu: "300m",
      requests_memory: "500Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
      probe: 300,
    },
    gitbook: {
      requests_cpu: "200m",
      requests_memory: "256Mi",
      limits_cpu: "200m",
      limits_memory: "256Mi",
    },
    kubeorigin: {
      requests_cpu: "1",
      requests_memory: "1Gi",
      limits_cpu: "2",
      limits_memory: "2Gi",
      probe: 60,
    },
    keycloak: {
      requests_cpu: "400m",
      requests_memory: "1Gi",
      limits_cpu: "800m",
      limits_memory: "2Gi",
      probe: 120,
    },
    log: {
      requests_cpu: "400m",
      requests_memory: "500Mi",
      limits_cpu: "800m",
      limits_memory: "1Gi",
      probe: 60,
    },
    lmd: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
      probe: 30,
    },
    metric: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "300m",
      limits_memory: "1Gi",
      probe: 300,
    },
    mongo: {
      requests_cpu: "200m",
      requests_memory: "256Mi",
      limits_cpu: "200m",
      limits_memory: "256Mi",
    },
    mysql: {
      requests_cpu: "2",
      requests_memory: "700Mi",
      limits_cpu: "3",
      limits_memory: "1300Mi",
    },
    notification: {
      requests_cpu: "400m",
      requests_memory: "1Gi",
      limits_cpu: "800m",
      limits_memory: "1500Mi",
      probe: 200,
    },
    rabbitmq: {
      requests_cpu: "1",
      requests_memory: "2Gi",
      limits_cpu: "3",
      limits_memory: "4Gi",
    },
    redis: {
      requests_cpu: "200m",
      requests_memory: "256Mi",
      limits_cpu: "200m",
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
      requests_cpu: "1",
      requests_memory: "700Mi",
      limits_cpu: "2",
      limits_memory: "1300Mi",
      probe: 60,
    },
    storage_listener: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "800Mi",
      probe: 300,
    },
    watch: {
      requests_cpu: "200m",
      requests_memory: "800Mi",
      limits_cpu: "400m",
      limits_memory: "1500Mi",
      probe: 300,
    },
    template: {
      requests_cpu: "200m",
      requests_memory: "800Mi",
      limits_cpu: "500m",
      limits_memory: "1600Mi",
      probe: 400,
    },
    terminal: {
      requests_cpu: "200m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1Gi",
      probe: 100,
    },
  },
  storage_config: {
    mysql: "rbd",
    mongo: "rbd",
    config_server: "cephfs",
  },
  misc: {
    mysql_storage: "console-mysql-pvc",
    upload_template: false,
    tf_url: "cc-tensorflow.cc-dev:8821",
    keycloak_storage_id: "95fa227a-8605-4983-a1bf-9c0974314308",
  },
}
