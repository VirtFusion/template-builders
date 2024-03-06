# Packer build scripts for VirtFusion

## Prepare templates on Debian 11/12

Install Debian 11/12 on a VM with at least 2GB RAM. Then run the following to prepare the environment.

```shell
apt-get install git curl unzip gnupg2 software-properties-common ansible -y
apt-get install --no-install-recommends qemu-system qemu-utils -y

git clone https://bitbucket.org/virtfusion-public/packer.git
cd packer

wget https://releases.hashicorp.com/packer/1.10.0/packer_1.10.0_linux_amd64.zip
unzip packer_1.10.0_linux_amd64.zip

./packer plugins install github.com/hashicorp/qemu
./packer plugins install github.com/hashicorp/ansible

mkdir source
```

Once all the requirements are installed you may build a template.

## Building Images

### Linux
#### AlmaLinux

```shell
./packer build -only=qemu.base-9-x86_64 alma.pkr.hcl
./packer build -only=qemu.gnome-9-x86_64 alma.pkr.hcl
```

#### Rocky Linux

```shell
./packer build -only=qemu.base-9-x86_64 rocky.pkr.hcl
./packer build -only=qemu.gnome-9-x86_64 rocky.pkr.hcl
```

#### Debian 10

```shell
./packer build -only=qemu.base-10-x86_64 debian.pkr.hcl
```

#### Debian 11

```shell
./packer build -only=qemu.base-11-x86_64 debian.pkr.hcl
./packer build -only=qemu.xfce-11-x86_64 debian.pkr.hcl
```

#### Debian 12

```shell
./packer build -only=qemu.base-12-x86_64 debian.pkr.hcl
```

#### Oracle Linux

```shell
./packer build -only=qemu.base-9-x86_64 oracle.pkr.hcl
./packer build -only=qemu.base-uek-9-x86_64 oracle.pkr.hcl
```

#### CentOS (Stream)

```shell
./packer build -only=qemu.base-9-x86_64 centos.pkr.hcl
```

### Microsoft Windows
A script is supplied to download the evaluation versions of Windows Server and the VirtIO drivers. This will allow you to build the evaluation versions.

```shell
sh windows-sources.sh
```

If you would like to build from retail media, you will need to supply the ISO images.

#### Server 2019

```shell
./packer build -only=qemu.server-2019-standard windows-server.pkr.hcl
./packer build -only=qemu.server-2019-standard-eval windows-server.pkr.hcl
```

#### Server 2022

```shell
./packer build -only=qemu.server-2022-standard windows-server.pkr.hcl
./packer build -only=qemu.server-2022-standard-eval windows-server.pkr.hcl
```

## Useful Windows Commands

### Remove Windows updates polices

```shell
reg delete HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate /f
```

### Disable Administrator Lockout Policy

```
secedit /export /cfg securityconfig.cfg
(Get-Content securityconfig.cfg).replace("AllowAdministratorLockout = 1", "AllowAdministratorLockout = 0") | Set-Content securityconfig.cfg
secedit /configure /db C:\Windows\security\local.sdb /cfg securityconfig.cfg /areas SECURITYPOLICY
Remove-Item securityconfig.cfg
```

