{
  global: {
    vip: "10.19.140.200",
    public_vip: "10.19.140.200",
    title_cn: "新智新氦应用平台",
    title_en: "Helium+ Data Platform",
    cluster_name: "shanghai",
    auth_enable: "true",
    commandline_enable: "true",
    keycloak_realm: "console-sso",
    keycloak_client: "console",
    version: "release",
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
    terminal: "29003",
    gitbook: "29004",
    lmb: "29005",
    harbor: "29006",
    rgw: "29100",
    scale: "29021",
    keycloak: "29270",
    local_repository: "29271",
  },
  apps: {
    console: "console",
    gateway: "gateway",
    lmd: "lmdashboard",
  },
  confidential: {
    elastic_search: {
      username: "elastic",
      password: "changeme",
    },
    keycloak: {
      username: "root",
      password: "root",
    },
    keystone: {
      username: "admin",
      password: "admin",
    },
    k8s: {
      username: "admin",
      password: "admin",
    },
    mysql: {
      username: "root",
      password: "root",
    },
    rabbitmq: {
      username: "admin",
      password: "enncloud",
    },
    redis: {
      username: "admin",
      password: "enncloud123456",
    },
    appautoscale: {
      username: "zhtsC1002",
      password: "zhtsC1002",
    },
  },
  ceph: {
    enable: false,
    health: {
      service: "ceph-restapi",
      port: 5000,
    },
    admin_keyring: "AQBtANlX3yKnGBAAc4aDNDazD9QITzoV+0OsGA==",
    admin_user: "admin",
    console_keyring_base64: "QVFDbXAyTmJMaWEzRFJBQS9hMjdKL3kzdTg2NDRPMXpsQVZDYVE9PQo=",
    monitors_without_port: ["10.19.137.144", "10.19.137.145", "10.19.137.146"],
    monitors: ["10.19.137.144:6789", "10.19.137.145:6789", "10.19.137.146:6789"],
    monitor_urls: "10.19.137.144:6789,10.19.137.145:6789,10.19.137.146:6789",
  },
  // nfs
  nfs: {
    enable: true,
    server: "nfs.dev.enndata.cn",
    server_dir: "/share-emh0YW5nc2g",
    args: "",
  },
  // s3 related configuration
  s3: {
    enable: true,
    host: "10.19.140.200:29100",
    access_key: "MYCIH9BX7QG8XTDEG7FR",
    secret_key: "7AK4vGhK5O1OlsLypdQO8JiCEcupJtLcLWCNJ7aD",
    app_id: "1258271314",
  },
  registry: {
    host: "127.0.0.1",
    port: 29006,
    project: "release",
  },
  audit_clear: {
    storage_limit: 0.4,
    table_limit: 0.15,
    clear_percent: 0.05,
  },
  // console
  fs_prefix: "/k8s/",
  // volume type
  persistentVolumeClaim: "persistentVolumeClaim",
  hostPath: "hostPath",
  configMap: "configMap",
  //============================================ Namespace Assignment ================================================================
  namespaces: {
    console: "console",
    ldap: "system-tools",
    keystone: "system-tools",
    gateway: "system-tools",
    k8s: "default",
    kube_system: "kube-system",
    prometheus: "monitor-application",
    ceph: "ceph",
    elastic_search: "monitor-essential-service",
    log_archive: "monitor-application",
    opentsdb: "monitor-essential-service",
  },
  //============================================ System Components ================================================================
  // elastic search
  elastic_search: {
    service: "pre1-esclient-ex",
    port: 9200,
    kubelet_table: "kubelet*",
    kube_proxy_table: "kubeproxy*",
    flanneld_table: "flanneld*",
  },
  // log archive
  log_archive: {
    service: "enn-monitor-log-archive-server",
    port: 10000,
  },
  // opentsdb
  opentsdb: {
    service: "pre1-opentsdb",
    port: 4242,
  },
  // prometheus
  prometheus: {
    service: "prometheus-admin-center",
    grpc_port: 50052,
    health: {
      service: "prometheus-engine",
      port: 9090,
    },
  },
  // scheduler
  scheduler: {
    host: "10.19.137.140",
    port: 8843,
  },
  // keystone
  keystone: {
    service: "keystone-service",
    port: 5000,
    cache_enable: true,
    token_expire_minutes: 60,
  },
  // k8s
  k8s: {
    service: "kubernetes",
    port: 443,
    filtered_namespaces: "default,kube-system,kube-public",
  },
  keycloak: {
    image_name: "keycloak",
    service: "keycloak",
    version: "4.1.0.console",
    port: 8080,
  },
  //============================================ Console Resource ================================================================
  resource: {
    account: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1Gi",
      probe: 500,
    },
    ansible: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1Gi",
      probe: 120,
    },
    audit: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1Gi",
      probe: 500,
    },
    backend: {
      requests_cpu: "200m",
      requests_memory: "1400Mi",
      limits_cpu: "1",
      limits_memory: "3Gi",
      probe: 250,
    },
    config_server: {
      requests_cpu: "100m",
      requests_memory: "512Mi",
      limits_cpu: "400m",
      limits_memory: "1024Mi",
      probe: 400,
    },
    console: {
      requests_cpu: "100m",
      requests_memory: "128Mi",
      limits_cpu: "200m",
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
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "800Mi",
      probe: 300,
    },
    initializer: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "800Mi",
      probe: 500,
    },
    gateway: {
      requests_cpu: "100m",
      requests_memory: "1300Mi",
      limits_cpu: "600m",
      limits_memory: "2Gi",
      probe: 300,
    },
    gc: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "1Gi",
      probe: 500,
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
      limits_cpu: "500m",
      limits_memory: "2Gi",
      probe: 200,
    },
    kubeorigin: {
      requests_cpu: "100m",
      requests_memory: "1Gi",
      limits_cpu: "500m",
      limits_memory: "2Gi",
      probe: 300,
    },
    lmd: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
      probe: 30,
    },
    local_repository: {
      requests_cpu: "100m",
      requests_memory: "256Mi",
      limits_cpu: "100m",
      limits_memory: "256Mi",
    },
    log: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
      probe: 100,
    },
    metric: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "500m",
      limits_memory: "1Gi",
      probe: 300,
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
      limits_cpu: "500m",
      limits_memory: "1300Mi",
      probe: 400,
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
      requests_memory: "700Mi",
      limits_cpu: "400m",
      limits_memory: "1300Mi",
      probe: 200,
    },
    storage_listener: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "200m",
      limits_memory: "800Mi",
      probe: 300,
    },
    watch: {
      requests_cpu: "100m",
      requests_memory: "800Mi",
      limits_cpu: "400m",
      limits_memory: "1500Mi",
      probe: 200,
    },
    template: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "400m",
      limits_memory: "800Mi",
      probe: 500,
    },
    terminal: {
      requests_cpu: "100m",
      requests_memory: "500Mi",
      limits_cpu: "300m",
      limits_memory: "1Gi",
      probe: 250,
    },
  },
  //============================================ Console Components ================================================================
  // account
  account: {
    service: "cc-account",
    port: 8816,
    image_name: "cc-account",
  },
  // ansible
  ansible: {
    service: "cc-ansible",
    port: 8825,
    image_name: "cc-ansible",
    storage: {
      name: "ansible-storage",
      mount_path: "/ansible",
      size: "20Gi",
    },
    config_map: {
      cluster_ssl: {
        name: "k8s-cluster-ssl",
        mount_path: "/cluster_ssl",
      },
      cluster_setting: {
        name: "k8s-cluster-setting",
        mount_path: "/cluster_setting",
      },
    },
  },
  // audit
  audit: {
    service: "cc-audit",
    port: 8803,
    image_name: "cc-audit",
  },
  // backend
  backend: {
    service: "cc-backend",
    port: 8800,
    image_name: "cc-backend",
  },
  // config server
  config_server: {
    service: "cc-config-server",
    image_name: "cc-config-server",
    version: "1.0.0",
    port: 8825,
    username: "admin",
    secret: {
      key: "security-password",
      name: "config-server-secret",
    },
    storage: {
      name: "config-server",
      mount_path: "/config",
      size: "100Mi",
    },
  },
  // console
  console: {
    service: "cc-console",
    port: 8006,
    image_name: "cc-console",
  },
  // dependency checker
  dependency_checker: {
    service: "dependency-checker",
    port: 8822,
    image_name: "dependency-checker",
  },
  // etcd
  etcd: {
    version: "3.2",
    service: "cc-etcd",
    server_port: 2379,
    client_port: 2380,
    image_name: "etcd",
  },
  // gateway
  gateway: {
    service: "cc-gateway",
    https_port: 8809,
    http_port: 8810,
    image_name: "cc-gateway",
  },
  // gc
  gc: {
    service: "cc-gc",
    port: 8822,
    image_name: "cc-gc",
  },
  // gitbook
  gitbook: {
    service: "cc-gitbook",
    port: 80,
    image_name: "cc-gitbook",
  },
  // harbor
  harbor: {
    service: "cc-harbor",
    port: 8819,
    image_name: "cc-harbor",
  },
  // initializer
  initializer: {
    service: "cc-initializer",
    port: 8820,
    image_name: "cc-initializer",
  },
  // kubeorigin
  kubeorigin: {
    service: "cc-kubeorigin",
    port: 8808,
    image_name: "cc-kubeorigin",
  },
  // lmd
  lmd: {
    version: "1.0.1",
    service: "cc-lmd",
    port: 4200,
    image_name: "lmdashboard",
  },
  // log
  local_repository: {
    service: "cc-local-repository",
    port: 80,
    image_name: "cc-local-repository",
  },
  // log
  log: {
    service: "cc-log",
    port: 8814,
    image_name: "cc-log",
  },
  // metric
  metric: {
    service: "cc-metric",
    port: 8813,
    image_name: "cc-metric",
  },
  // mongo
  mongo: {
    version: "3.4",
    service: "cc-mongo",
    port: 27017,
    image_name: "mongo",
    template_db: "template",
    storage: {
      name: "mongo",
      size: "10Gi",
    },
  },
  // mysql
  mysql: {
    service: "cc-mysql",
    version: "5.7.1",
    port: 3306,
    console_database: "cc",
    keycloak_database: "keycloak",
    storage: "mysql",
    mount_path: "/var/lib/mysql",
    storage_size: "100Gi",
  },
  // notification
  notification: {
    service: "cc-notification",
    http_port: 8811,
    grpc_port: 8812,
    image_name: "cc-notification",
  },
  // rabbitmq
  rabbitmq: {
    service: "cc-rabbitmq",
    version: "3-management",
    port: 5672,
  },
  // redis
  redis: {
    service: "cc-redis",
    version: "4.0.1",
    port: 6379,
  },
  scale_console: {
    service: "scale-console",
    port: 80,
    image_name: "scale-console",
  },
  // storage
  storage: {
    service: "cc-storage",
    port: 8802,
    storage: "dev",
    storage_path: "/dev/",
    image_name: "cc-storage",
  },
  // storage listener
  storage_listener: {
    service: "cc-storage-listener",
    port: 8822,
    image_name: "cc-storage-listener",
  },
  // watch
  watch: {
    service: "cc-watch",
    port: 8817,
    image_name: "cc-watch",
  },
  // template
  template: {
    service: "cc-template",
    port: 8804,
    image_name: "cc-template",
  },
  // terminal
  terminal: {
    service: "cc-terminal",
    port: 8818,
    image_name: "cc-terminal",
  },
  //============================================ Others ====================================================================
  // node_auto_scale legacy scaler
  node_auto_scale: {
    url: "https://139.224.117.145:32085",
    username: "P0UGJSigOCKD8Zz7",
    password: "hold3Z14ofHThl7h",
  },
  // aws related configuration
  aws: {
    ebs_enable: false,
    access_key: "AKIAISLWUKZLBJI6X3NQ",
    secret_key: "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",
    region: "ap-northeast-2",
    zone: "ap-northeast-2a",
  },
  // appautoscale service in kube_system namesapce,
  appautoscale: {
    service: "appautoscale",
    port: 80,
  },
  kafka: {
    url: "pre1-kafka1:9092,pre1-kafka2:9092,pre1-kafka3:9092",
  },
  ldap: {
    service: "ldaps-ha-svc",
    port: 389,
    domain: "dc=enncloud,dc=com",
    admin_user: "cn=admin",
    admin_password: "pass@rrr123",
    dn: "ou=users",
    id_attribute: "uid",
    name_attribute: "sn",
    email_attribute: "mail",
    first_name_attribute: "",
    last_name_attribute: "",
  },
  misc: {
    mysql_storage: "mysql",
  },
}
