{
  local basic = import "example/install-agile/install-basic-agile.jsonnet",
  local basic_component = import "example/install-agile/install-basic-component-agile.jsonnet",
  local console_basic = import "example/install-agile/install-console-agile.jsonnet",
  "basic-specicifation.json": basic,
  "basic-component-specification.json": basic_component,
  "console-basic-specicifation.json": console_basic,
}
