variables {
  vnc_bind_address  = "0.0.0.0"
  vnc_port_max      = "5920"
  vnc_port_min      = "5920"
  accelerator       = "kvm"
  headless          = "true"
  output_dir        = "../output/"
  qemu_disk_cache   = "unsafe"
  qemu_format       = "qcow2"
  boot_wait         = "5s"
  disk_compression  = true
  disk_discard      = "unmap"
  arc               = "x86_64"
  disk_interface    = "virtio-scsi"
  format            = "qcow2"
  net_device        = "virtio-net"
  config_folder     = "config/"
  ssh_username      = "root"
  ssh_password      = "S33!]HsHym/cK.n*<#,)#Nx2_h5Y>MN74xT,j4}Ak9Ny[3,yB"
  ssh_wait_timeout  = "60m"
  cpu               = "4"
  ram               = "2048"
  cpu_model         = "host"
  iso_checksum_type = "sha245"
  iso_9             = "https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-20230508.0-x86_64-boot.iso"
  iso_9_checksum    = "00f655b4e56045997ca74d2e76acc63f795a98aa58f51934a11d7a225ae8488b"
  config_file_base  = "ks-base.cfg"
}


source "qemu" "base-9-x86_64" {
  vm_name          = "centos-stream-9-x86_64.qcow2"
  output_directory = "${var.output_dir}centos-stream-9-x86_64"
  disk_size        = "3000"
  boot_command     = [
    "c<wait>",
    "linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=CentOS-Stream-9-BaseOS-x86_64 ro ",
    "inst.text biosdevname=0 net.ifnames=0 ",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.config_folder}centos-stream-9/http/${var.config_file_base}<enter>",
    "initrdefi /images/pxeboot/initrd.img<enter>",
    "boot<enter><wait>"
  ]
  boot_wait        = var.boot_wait
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  disk_compression = var.disk_compression
  disk_discard     = var.disk_discard
  disk_interface   = var.disk_interface
  format           = var.format
  headless         = var.headless
  cpu_model        = var.cpu_model
  http_directory   = "."
  iso_checksum     = var.iso_9_checksum
  iso_urls         = [var.iso_9]
  net_device       = var.net_device
  machine_type     = "q35"
  qemuargs         = [["-m", "${var.ram}M"], ["-smp", "${var.cpu}"]]
  shutdown_command = "echo '${var.ssh_password}' | shutdown -P now"
  ssh_password     = var.ssh_password
  ssh_username     = var.ssh_username
  ssh_wait_timeout = var.ssh_wait_timeout
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
}

build {
  sources = ["source.qemu.base-9-x86_64"]

  provisioner "ansible" {
    ansible_env_vars = [
      "ANSIBLE_SSH_ARGS='-o ControlMaster=no -o ControlPersist=180s -o ServerAliveInterval=120s -o TCPKeepAlive=yes'"
    ]
    playbook_file = "./${var.config_folder}centos-stream-9/ansible/default.yml"
    roles_path    = "./${var.config_folder}centos-stream-9/ansible/roles"
  }


  provisioner "shell" {
    execute_command = "{{ .Vars }} bash '{{ .Path }}'"
    inline          = [
      "dd if=/dev/zero of=/EMPTY bs=1M", "rm -rf /EMPTY", "sync", "history -c", "passwd -d root", "passwd -l root"
    ]
  }

}