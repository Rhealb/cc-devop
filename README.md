# cc-devop

## Description
This project provide variety functions for operating and maintenance purpose in console team. Refer bellow for its functions.

- [x] Generate Kubernetes specification for console components, i.e. cc-console, mysql, cc-config-server and etc.
- [x] Generate springboot configuration used in console Java based components, i.e. cc-backend, cc-account and etc.
- [x] Support cluster specific setting for multiple environment, currently supports
  - sh-dev(http://10.19.140.200:29210)
  - sh-itg(http://10.19.140.200:29220)
  - sh-stage(http://10.19.140.200:29000)
  - yc(http://10.19.248.200:32206).
- [x] Support build all console component images for release/product purpose.
- [x] Support build one or some of console component images.
- [x] Support health check.
- [ ] `WIP` Support deploy to a specific cluster automatically.
- [ ] `WIP` Support smoke integration test for console functionality.

## Prerequisite

To use this project, you need following softwares and privileges.
- Docker.
- Jsonnet v0.10.0 plus.
- GNU automake.
- kubectl with proper setup.
  - shanghai admin token with context named sh-context
  - yancheng admin token with context named yc-context


## Usage
Clone and initialize this project.
``` bash
cd ~ && git clone ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-devop.git
cd cc-devop && git submodule update --init --recursive
```
Build images for all console component with current version.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make build-image
make clean
```
Build images for one or more of console components with current version.
Upgrade console with specific version.
``` bash
cd ~/cc-devop #root directory of cc-devop project
script/imagebuildctl.sh console backend gitbook
make clean
```
Upgrade sh-dev(http://10.19.140.200:29210) by script.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make sh-dev
make clean
```
Upgrade sh-itg(http://10.19.140.200:29220) by script.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make sh-itg
make clean
```
Upgrade sh-stage(http://10.19.140.200:29000) by script.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make sh-stage
make clean
```
Upgrade yc(http://10.19.248.200:32206) by script.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make yc
make clean
```

Health check sh-dev (http://10.19.140.200:29210) by script.
``` bash
cd ~/cc-devop #root directory of cc-devop project
make check-sh-dev
make clean
```
