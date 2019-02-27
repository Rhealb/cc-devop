.PHONY: fmt
fmt:
	@ bash script/format.sh

.PHONY: sh-dev
sh-dev: jsonnet/example/sh-dev-config.jsonnet script/upgradectl.sh
	@ bash script/upgradectl.sh -l sh-dev

.PHONY: sh-itg
sh-itg: jsonnet/example/sh-itg-config.jsonnet script/upgradectl.sh
	@ bash script/upgradectl.sh -l sh-itg

.PHONY: sh-stage
sh-stage: jsonnet/example/sh-stage-config.jsonnet script/upgradectl.sh
	@ bash script/upgradectl.sh -l sh-stage

.PHONY: yc
yc: jsonnet/example/yc-config.jsonnet script/upgradectl.sh
	@ bash script/upgradectl.sh -l yc

.PHONY: yc-backup
yc-backup: jsonnet/example/yc-backup-config.jsonnet script/upgradectl.sh
	@ bash script/upgradectl.sh -l yc-backup

.PHONY: install
install: jsonnet/example/install-config.jsonnet script/installctl.sh
	@ bash script/installctl.sh console

.PHONY: install-agile
install-agile: jsonnet/example/install-config.jsonnet script/installctl-agile.sh
	@ bash script/installctl-agile.sh console

.PHONY: install-agile-check
install-agile-check: jsonnet/example/install-config.jsonnet script/install-agile-check.sh
	@ bash script/install-agile-check.sh

.PHONY: install-check
install-check: jsonnet/example/install-config.jsonnet script/install-check.sh
	@ bash script/install-check.sh

.PHONY: install-clean
install-clean: jsonnet/example/test-config.jsonnet script/install-clean.sh
	@ bash script/install-clean.sh

.PHONY: build-image
build-image: script/imagebuildctl.sh
	@ bash script/imagebuildctl.sh -a

.PHONY: build-image-yc
build-image-yc: script/imagebuildctl.sh
	@ bash script/imagebuildctl.sh -a -y

.PHONY: sync-git
sync-git: script/fetch-console-release.sh
	@ git submodule update --remote

.PHONY: sync-git-1.4
sync-git-1.4: script/fetch-console-release.sh
	@ bash script/fetch-console-release.sh helium-1.4

.PHONY: clean
clean: script/clean.sh
	@ bash script/clean.sh

.PHONY: check-sh-dev
check-sh-dev: jsonnet/example/sh-dev-config.jsonnet script/healthctl.sh
	@ bash script/healthctl.sh -l sh-dev
