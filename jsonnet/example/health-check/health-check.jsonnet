{
  local config = import "example/config.jsonnet",
  local kube = (import "example/health-check/kube.jsonnet") + {
    _config: config,
  },
  "config.sh": |||
    #!/bin/bash
    CONSOLE_NS=%(console_ns)s
    GATEWAY_NS=%(gateway_ns)s
    MYSQL_USERNAME=%(mysql_username)s
    MYSQL_PASSWORD=%(mysql_passowrd)s
    PUBLIC_VIP=%(public_vip)s
    GATEWAY_NODE_PORT=%(gateway_node_port)s
  ||| % {
    console_ns: config.namespaces.console,
    gateway_ns: config.namespaces.gateway,
    mysql_username: config.confidential.mysql.username,
    mysql_passowrd: config.confidential.mysql.password,
    public_vip: config.global.public_vip,
    gateway_node_port: config.node_ports.gateway_http,
  },
  "ceph.conf": |||
    [global]
      mon_host = %(ceph_urls)s
  ||| % {
    ceph_urls: config.ceph.monitor_urls,
  },
  "ceph.client.admin.keyring": |||
    [client.admin]
      key = %(ceph_admin_keyring)s
      caps mds = "allow *"
      caps mon = "allow *"
      caps osd = "allow *"
  ||| % {
    ceph_admin_keyring: config.ceph.admin_keyring,
  },
  config: std.manifestYamlDoc(kube),
}
