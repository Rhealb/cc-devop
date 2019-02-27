{
  local global_config = import "config.jsonnet",
  local config = (import "../global/config.jsonnet") + {
    global: global_config.global,
    node_ports: global_config.node_ports,
    confidential: global_config.confidential,
    ceph: global_config.ceph,
    nfs: global_config.nfs,
    s3: global_config.s3,
    namespaces: global_config.namespaces,
    scheduler: global_config.scheduler,
    resource: global_config.resource,
  },
  local account = (import "../account/list/account-list.jsonnet") + {
    _global_config: config,
  },
  local audit = (import "../audit/list/audit-list.jsonnet") + {
    _global_config: config,
  },
  local backend = (import "../backend/list/backend-list.jsonnet") + {
    _global_config: config,
  },
  local config_server = (import "../config-server/list/config-server-list.jsonnet") + {
    _global_config: config,
  },
  local config_server_storage = (import "../config-server/list/config-server-storage-list.jsonnet") + {
    _global_config: config,
  },
  local console = (import "../console/list/console-list.jsonnet") + {
    _global_config: config,
  },
  local dependency_checker = (import "../dependency-checker/list/dependency-checker-list.jsonnet") + {
    _global_config: config,
  },
  local etcd = (import "../etcd/list/etcd-list.jsonnet") + {
    _global_config: config,
  },
  local gateway = (import "../gateway/list/gateway-list.jsonnet") + {
    _global_config: config,
  },
  local gc = (import "../gc/list/gc-list.jsonnet") + {
    _global_config: config,
  },
  local gitbook = (import "../gitbook/list/gitbook-list.jsonnet") + {
    _global_config: config,
  },
  local harbor = (import "../harbor/list/harbor-list.jsonnet") + {
    _global_config: config,
  },
  local initializer = (import "../initializer/list/initializer-list.jsonnet") + {
    _global_config: config,
  },
  local kubeorigin = (import "../kubeorigin/list/kubeorigin-list.jsonnet") + {
    _global_config: config,
  },
  local log = (import "../log/list/log-list.jsonnet") + {
    _global_config: config,
  },
  local metric = (import "../metric/list/metric-list.jsonnet") + {
    _global_config: config,
  },
  local mongo = (import "../mongo/list/mongo-list.jsonnet") + {
    _global_config: config,
  },
  local mongo_storage = (import "../mongo/list/mongo-storage-list.jsonnet") + {
    _global_config: config,
  },
  local mysql = (import "../mysql/list/mysql-list.jsonnet") + {
    _global_config: config,
  },
  local mysql_storage = (import "../mysql/list/mysql-storage-list.jsonnet") + {
    _global_config: config,
  },
  local notification = (import "../notification/list/notification-list.jsonnet") + {
    _global_config: config,
  },
  local rabbitmq = (import "../rabbitmq/list/rabbitmq-list.jsonnet") + {
    _global_config: config,
  },
  local redis = (import "../redis/list/redis-list.jsonnet") + {
    _global_config: config,
  },
  local storage = (import "../storage/list/storage-list.jsonnet") + {
    _global_config: config,
  },
  local storage_listener = (import "../storage-listener/list/storage-listener-list.jsonnet") + {
    _global_config: config,
  },
  local template = (import "../template/list/template-list.jsonnet") + {
    _global_config: config,
  },
  local terminal = (import "../terminal/list/terminal-list.jsonnet") + {
    _global_config: config,
  },
  local watch = (import "../watch/list/watch-list.jsonnet") + {
    _global_config: config,
  },
  kind: "List",
  apiVersion: "v1",
  items: account.items + backend.items + audit.items + config_server.items + console.items + dependency_checker.items
         + etcd.items + gateway.items + gc.items + gitbook.items + harbor.items + initializer.items + kubeorigin.items
         + log.items + metric.items + mongo.items + mysql.items + notification.items + rabbitmq.items + redis.items
         + storage.items + storage_listener.items + template.items + terminal.items + watch.items
         + config_server_storage.items + mongo_storage.items + mysql_storage.items,
}
