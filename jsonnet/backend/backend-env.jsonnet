{
  // config variables
  _global_config:: {},
  // content
  spring: {
    datasource: {
      url: std.format("jdbc:mysql://%s.%s:%s/%s?useUnicode=true&characterEncoding=utf8", [
        $._global_config.mysql.service,
        $._global_config.namespaces.console,
        $._global_config.mysql.port,
        $._global_config.mysql.console_database,
      ]),
      username: $._global_config.confidential.mysql.username,
      password: $._global_config.confidential.mysql.password,
    },
    jpa: {
      "show-sql": false,
      hibernate: {
        "ddl-auto": "update",
      },
    },
    rabbitmq: {
      host: std.format("%s.%s", [
        $._global_config.rabbitmq.service,
        $._global_config.namespaces.console,
      ]),
      port: $._global_config.rabbitmq.port,
      username: $._global_config.confidential.rabbitmq.username,
      password: $._global_config.confidential.rabbitmq.password,
      listener: {
        simple: {
          retry: {
            enabled: true,
            "max-attempts": 5,
            "initial-interval": 5000,
            multiplier: 5,
            "max-interval": 60000,
          },
        },
      },
    },
    redis: {
      password: $._global_config.confidential.redis.password,
      host: std.format("%s.%s", [
        $._global_config.redis.service,
        $._global_config.namespaces.console,
      ]),
      port: $._global_config.redis.port,
    },
  },
  logging: {
    level: {
      root: "WARN",
      cc: "INFO",
    },
    file: "/var/log/cc-backend.log",
  },
  enn: {
    "auth-enabled": $._global_config.global.auth_enable,
    "global-search": {
      "cache-expire-seconds": 15,
    },
    security: {
      enable: true,
      receive: "BACKEND",
    },
    "default-cluster": "sh",
    "default-hibernate": "sh",
    "status-check": {
      "period-millis": {
        namespace: 60000,
        storage: 120000,
        default: 60000,
      },
    },
    http: {
      "connect-timeout-millis": 30000,
      "read-timeout-millis": 60000,
      "write-timeout-millis": 60000,
    },
    hibernate: {
      sh: {
        name: "sh",
        "base-url": std.format("jdbc:mysql://%s.%s:%s", [
          $._global_config.mysql.service,
          $._global_config.namespaces.console,
          $._global_config.mysql.port,
        ]),
        db: $._global_config.mysql.console_database,
        username: $._global_config.confidential.mysql.username,
        password: $._global_config.confidential.mysql.password,
        "driver-class-name": "com.mysql.jdbc.Driver",
        "show-sql": false,
        "ddl-auto": "update",
        dialect: "org.hibernate.dialect.MySQLDialect",
      },
    },
    clusters: {
      sh: {
        kubernetes: {
          "vip-host": $._global_config.global.public_vip,
          "master-url": std.format("https://%s.%s:%s", [
            $._global_config.k8s.service,
            $._global_config.namespaces.k8s,
            $._global_config.k8s.port,
          ]),
          admin: {
            username: $._global_config.confidential.k8s.username,
            password: $._global_config.confidential.k8s.password,
          },
          "system-namespaces": $._global_config.k8s.filtered_namespaces,
          "login-with-token": false,
          "cache-enabled": $._global_config.keystone.cache_enable,
          token: "abc",
        },
        "cache-enabled": $._global_config.keystone.cache_enable,
        ceph: {
          enabled: $._global_config.ceph.enable,
          "dir-prefix": $._global_config.fs_prefix,
          monitors: $._global_config.ceph.monitor_urls,
        },
        nfs: {
          address: $._global_config.nfs.server,
          "server-dir": $._global_config.nfs.server_dir,
          enabled: $._global_config.nfs.enable,
          "dir-prefix": $._global_config.fs_prefix,
        },
        opentsdb: {
          url: std.format("http://%s.%s:%s/api", [
            $._global_config.opentsdb.service,
            $._global_config.namespaces.opentsdb,
            $._global_config.opentsdb.port,
          ]),
          "cluster-name": $._global_config.global.cluster_name,
          "delay-seconds": 20,
        },
        scheduler: {
          host: $._global_config.scheduler.host,
          port: $._global_config.scheduler.port,
          username: $._global_config.confidential.scheduler.username,
          password: $._global_config.confidential.scheduler.password,
        },
        cc: {
          "dependency-checker": std.format("http://%s.%s:%s/api", [
            $._global_config.dependency_checker.service,
            $._global_config.namespaces.console,
            $._global_config.dependency_checker.port,
          ]),
          template: {
            url: std.format("http://%s.%s:%s/api", [
              $._global_config.template.service,
              $._global_config.namespaces.console,
              $._global_config.template.port,
            ]),
          },
          account: std.format("http://%s.%s:%s/gw/ac/api/v1/", [
            $._global_config.gateway.service,
            $._global_config.namespaces.gateway,
            $._global_config.gateway.http_port,
          ]),
          kubeorigin: std.format("http://%s.%s:%s/gw/ko/api/v1", [
            $._global_config.gateway.service,
            $._global_config.namespaces.gateway,
            $._global_config.gateway.http_port,
          ]),
        },
        ali: {
          "node-auto-scale": {
            url: $._global_config.node_auto_scale.url,
            username: $._global_config.node_auto_scale.username,
            password: $._global_config.node_auto_scale.password,
          },
        },
        ebs: {
          enabled: $._global_config.aws.ebs_enable,
          "total-bytes": 1024,
          "access-key": $._global_config.aws.access_key,
          "secret-key": $._global_config.aws.secret_key,
          region: $._global_config.aws.region,
          zone: $._global_config.aws.zone,
        },
      },
    },
    S3: {
      enabled: $._global_config.s3.enable,
      "access-key": $._global_config.s3.access_key,
      "secret-key": $._global_config.s3.secret_key,
      host: $._global_config.s3.host,
      "app-id": $._global_config.s3.app_id,
    },
  },
  podScale: {
    scaleServer: {
      "base-url": std.format("https://%s.%s:%s", [
        $._global_config.appautoscale.service,
        $._global_config.namespaces.kube_system,
        $._global_config.appautoscale.port,
      ]),
      username: $._global_config.confidential.appautoscale.username,
      password: $._global_config.confidential.appautoscale.password,
    },
  },
}
