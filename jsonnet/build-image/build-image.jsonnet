{
  local commit = import "global/commit.jsonnet",
  local config = import "global/config.jsonnet",
  "version.sh": |||
    #!/bin/bash
    CONSOLE_VERSION=%(version)s
    ACCOUNT_COMMIT=%(account_commit)s
    ACCOUNT_IMAGE=%(account_image)s
    AUDIT_COMMIT=%(audit_commit)s
    AUDIT_IMAGE=%(audit_image)s
    BACCKEND_COMMIT=%(backend_commit)s
    BACCKEND_IMAGE=%(backend_image)s
    CONSOLE_COMMIT=%(console_commit)s
    CONSOLE_IMAGE=%(console_image)s
    DEPENDENCY_CHECKER_COMMIT=%(dependency_checker_commit)s
    DEPENDENCY_CHECKER_IMAGE=%(dependency_checker_image)s
    GATEWAY_COMMIT=%(gateway_commit)s
    GATEWAY_IMAGE=%(gateway_image)s
    GC_COMMIT=%(gc_commit)s
    GC_IMAGE=%(gc_image)s
    GITBOOK_COMMIT=%(gitbook_commit)s
    GITBOOK_IMAGE=%(gitbook_image)s
    HARBOR_COMMIT=%(harbor_commit)s
    HARBOR_IMAGE=%(harbor_image)s
    INITIALIZER_COMMIT=%(initializer_commit)s
    INITIALIZER_IMAGE=%(initializer_image)s
    KUBEORIGIN_COMMIT=%(kubeorigin_commit)s
    KUBEORIGIN_IMAGE=%(kubeorigin_image)s
    LOG_COMMIT=%(log_commit)s
    LOG_IMAGE=%(log_image)s
    METRIC_COMMIT=%(metric_commit)s
    METRIC_IMAGE=%(metric_image)s
    NOTIFICATION_COMMIT=%(notification_commit)s
    NOTIFICATION_IMAGE=%(notification_image)s
    STORAGE_LISTENER_COMMIT=%(storage_listener_commit)s
    STORAGE_LISTENER_IMAGE=%(storage_listener_image)s
    STORAGE_COMMIT=%(storage_commit)s
    STORAGE_IMAGE=%(storage_image)s
    TEMPLATE_COMMIT=%(template_commit)s
    TEMPLATE_IMAGE=%(template_image)s
    TERMINAL_COMMIT=%(terminal_commit)s
    TERMINAL_IMAGE=%(terminal_image)s
    WATCH_COMMIT=%(watch_commit)s
    WATCH_IMAGE=%(watch_image)s
  ||| % {
    version: config.global.version,
    account_image: config.account.image_name,
    account_commit: commit.console.account,
    audit_image: config.audit.image_name,
    audit_commit: commit.console.audit,
    backend_image: config.backend.image_name,
    backend_commit: commit.console.backend,
    console_image: config.console.image_name,
    console_commit: commit.console.console,
    dependency_checker_image: config.dependency_checker.image_name,
    dependency_checker_commit: commit.console.dependency_checker,
    gitbook_commit: commit.console.gitbook,
    gitbook_image: config.gitbook.image_name,
    gateway_image: config.gateway.image_name,
    gateway_commit: commit.console.gateway,
    gc_image: config.gc.image_name,
    gc_commit: commit.console.gc,
    harbor_image: config.harbor.image_name,
    harbor_commit: commit.console.harbor,
    initializer_image: config.initializer.image_name,
    initializer_commit: commit.console.initializer,
    kubeorigin_image: config.kubeorigin.image_name,
    kubeorigin_commit: commit.console.kubeorigin,
    log_image: config.log.image_name,
    log_commit: commit.console.log,
    metric_image: config.metric.image_name,
    metric_commit: commit.console.metric,
    notification_image: config.notification.image_name,
    notification_commit: commit.console.notification,
    storage_image: config.storage.image_name,
    storage_commit: commit.console.storage,
    storage_listener_image: config.storage_listener.image_name,
    storage_listener_commit: commit.console.storage_listener,
    template_image: config.template.image_name,
    template_commit: commit.console.template,
    terminal_image: config.terminal.image_name,
    terminal_commit: commit.console.terminal,
    watch_image: config.watch.image_name,
    watch_commit: commit.console.watch,
  },
}
