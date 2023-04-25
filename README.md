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
packer build -only=qemu.base-9-x86_64 alma.pkr.hcl
packer build -only=qemu.gnome-9-x86_64 alma.pkr.hcl
```

### Rocky Linux
```shell
packer build -only=qemu.base-9-x86_64 rocky.pkr.hcl
packer build -only=qemu.gnome-9-x86_64 rocky.pkr.hcl
```

### Debian 10
```shell
packer build -only=qemu.base-10-x86_64 debian.pkr.hcl
```

### Debian 11
```shell
packer build -only=qemu.base-11-x86_64 debian.pkr.hcl
packer build -only=qemu.xfce-11-x86_64 debian.pkr.hcl
```

### Debian 12
```shell
packer build -only=qemu.base-12-x86_64 debian.pkr.hcl
```

### Oracle Linux
```shell
packer build -only=qemu.base-9-x86_64 oracle.pkr.hcl
packer build -only=qemu.base-uek-9-x86_64 oracle.pkr.hcl
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