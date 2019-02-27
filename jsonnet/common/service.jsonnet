(import "meta.jsonnet") + {
  // global variables
  _spec_name:: $._meta_name,
  _spec_app:: $._meta_app,
  _spec_type:: "ClusterIP",
  _spec_ports:: [],
  _nameports:: [],
  _nodeports:: [],

  apiVersion: "v1",
  kind: "Service",
  spec: {
    selector: {
      X_APP: $._spec_app,
      name: $._spec_name,
    },
    local port_list = [std.split(port, ":") for port in $._spec_ports],
    ports: [
      {
        name: port[0],
        port: std.parseInt(port[1]),
        targetPort: std.parseInt(port[1]),
        [if $._spec_type == "NodePort" then "nodePort"]: std.parseInt(port[2]),
      }
      for port in port_list
    ],
    type: if $._spec_type == "NodePort" || $._spec_type == "ClusterIP" then
      $._spec_type
    else
      error "Unkown servicetype(" + $._spec_type + ")",
  },
}
