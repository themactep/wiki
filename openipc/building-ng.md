# THIS IS HEAVILY EXPERIMENTAL!

Building firmware (NG)
----------------------

A major difference from the original OpenIPC Firmware building process 
is that everything has been incorporated into Makefile.

### Configuration

Clone the repository to your PC.
```
git clone --recurse-submodules https://github.com/themactep/openipc-firmware
```
Open `Makefile` in a text editor and adjust it to your development environment.

Set up a permanent storage for downloading source files used by Buildroot:
```
BR2_DL_DIR := /home/paul/mnt/chulan/downloads_br
```
Set up local TFTP server IP address:
```
TFTP_SERVER_IP := 192.168.1.254
```

### Compilation

Run `make` in the root directory of the project.

Firmware `Makefile` handles out-of-tree tasks and then delegates the rest of the
job to Buildroot, accompanied by set of variables for a particular board.

Any Buildroot task can be proxied directly to Buildroot if prefixed with `br-`,
e.g. `make br-linux` equals to `make linux` ran in Buildroot directory.

### Development

Buildroot makes it easy to work with in-tree and out-of-tree packages. 
Each package gets a set of pre-defined `make` tasks which are helpful for 
checking up on compilation at different stages. Here's a list of standard 
Buldroot package commands, where `<pkg>` stands for a package name:

```
<pkg>                         - Build and install <pkg> and all its dependencies
<pkg>-source                  - Only download the source files for <pkg>
<pkg>-extract                 - Extract <pkg> sources
<pkg>-patch                   - Apply patches to <pkg>
<pkg>-depends                 - Build <pkg>'s dependencies
<pkg>-configure               - Build <pkg> up to the configure step
<pkg>-build                   - Build <pkg> up to the build step
<pkg>-show-info               - Generate info about <pkg>, as a JSON blurb
<pkg>-show-depends            - List packages on which <pkg> depends
<pkg>-show-rdepends           - List packages which have <pkg> as a dependency
<pkg>-show-recursive-depends  - Recursively list packages on which <pkg> depends
<pkg>-show-recursive-rdepends - Recursively list packages which have <pkg> as a dependency
<pkg>-graph-depends           - Generate a graph of <pkg>'s dependencies
<pkg>-graph-rdepends          - Generate a graph of <pkg>'s reverse dependencies
<pkg>-dirclean                - Remove <pkg> build directory
<pkg>-reconfigure             - Restart the build from the configure step
<pkg>-rebuild                 - Restart the build from the build step
<pkg>-reinstall               - Restart the build from the install step
```
