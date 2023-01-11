# Packer build scripts for VirtFusion

## Prepare templates on Debian 11

Install Debian 11 on a VM with at least 2GB RAM. Then run the following to prepare the environment.

```shell
apt-get install git curl gnupg2 software-properties-common ansible -y
apt-get install --no-install-recommends qemu-system qemu-utils -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update
apt-get install packer -y

git clone https://bitbucket.org/virtfusion-public/packer.git
cd packer
mkdir source
```

Once all the requirements are installed you may build a template.

### AlmaLinux
```shell
packer build almalinux-8-minimal.json
```

### Rocky Linux
```shell
packer build rocky-linux-8-minimal.json
packer build rocky-linux-9-minimal.json
```

### Debian 11
```shell
packer build debian-11-minimal.json
```

### CentOS 7 
```shell
packer build centos-7-minimal.json
```

### Windows Server 2019
```shell
sh windows-sources.sh
packer build -only=qemu.server-2019-standard .
packer build -only=qemu.server-2019-datacenter .
```

### Windows Server 2022
```shell
sh windows-sources.sh
packer build -only=qemu.server-2022-standard .
packer build -only=qemu.server-2022-datacenter .
```

# Useful Windows Commands

## Remove Windows updates polices

```shell
reg delete HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate /f
```