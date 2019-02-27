{
  // config variables
  _global_config:: {},
  // content
  spring: {
    datasource: {
      url: std.format("jdbc:mysql://%s.%s:%s/%s", [
        $._global_config.mysql.service,
        $._global_config.namespaces.console,
        $._global_config.mysql.port,
        $._global_config.mysql.console_database,
      ]),
      username: $._global_config.confidential.mysql.username,
      password: $._global_config.confidential.mysql.password,
      "driver-class-name": "com.mysql.jdbc.Driver",
    },
    jpa: {
      "show-sql": false,
      hibernate: {
        "ddl-auto": "update",
      },
    },
    mail: {
      "default-encoding": "utf-8",
      host: "10.19.248.200",
      port: 30071,
      username: "account-security-noreply@enndata.cn",
      password: "Console2018@",
      protocol: "smtp",
      auth: true,
      debugmod: true,
      loginLink: std.format("http://%s:%s/#/auth/login", [
        $._global_config.global.public_vip,
        $._global_config.node_ports.console,
      ]),
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
  ldap: {
    host: std.format("%s.%s", [
      $._global_config.ldap.service,
      $._global_config.namespaces.ldap,
    ]),
    port: $._global_config.ldap.port,
    domain: $._global_config.ldap.domain,
    dc: "enncloud",
    root: "com",
    "need-login": true,
    admin: {
      user: $._global_config.ldap.admin_user,
      password: $._global_config.ldap.admin_password,
    },
    user: {
      dn: $._global_config.ldap.dn,
      "id-attribute": $._global_config.ldap.id_attribute,
      "name-attribute": $._global_config.ldap.name_attribute,
      "email-attribute": $._global_config.ldap.email_attribute,
      "first-name-attribute": $._global_config.ldap.first_name_attribute,
      "last-name-attribute": $._global_config.ldap.last_name_attribute,
    },
  },
  account: {
    "sync-period-millis": 600000,
    "sync-xinao-users": false,
    "http-connect-timeout-millis": 30000,
    "http-read-timeout-millis": 30000,
    "http-write-timeout-millis": 30000,
  },
  enn: {
    security: {
      enable: true,
      receive: "ACCOUNT",
      "white-list-type": "normal",
      "white-list": "GET",
    },
    http: {
      "connect-timeout-millis": 30000,
      "read-timeout-millis": 60000,
      "write-timeout-millis": 60000,
    },
    clusters: {
      sh: {
        "cache-enabled": $._global_config.keystone.cache_enable,
        keystone: {
          url: std.format("http://%s.%s:%s/v3", [
            $._global_config.keystone.service,
            $._global_config.namespaces.keystone,
            $._global_config.keystone.port,
          ]),
          admin: {
            username: $._global_config.confidential.keystone.username,
            password: $._global_config.confidential.keystone.password,
            project: "admin",
          },
          "cache-enabled": $._global_config.keystone.cache_enable,
          "token-expire-minutes": $._global_config.keystone.token_expire_minutes,
        },

      },
    },
  },
  keycloak: {
    url: std.format("http://%s.%s:%s", [
      $._global_config.keycloak.service,
      $._global_config.namespaces.keycloak,
      $._global_config.keycloak.port,
    ]),
    realm: $._global_config.keycloak_config.realm,
    "user-storage-id": $._global_config.misc.keycloak_storage_id,
    username: $._global_config.confidential.keycloak.username,
    password: $._global_config.confidential.keycloak.username,
  },
  "logging.level": {
    root: "WARN",
    "cc.account": "INFO",
  },
}
