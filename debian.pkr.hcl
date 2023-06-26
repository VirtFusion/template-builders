variables {
  vnc_bind_address     = "0.0.0.0"
  vnc_port_max         = "5920"
  vnc_port_min         = "5920"
  accelerator          = "kvm"
  headless             = "true"
  output_dir           = "../output/"
  qemu_disk_cache      = "writeback"
  qemu_format          = "qcow2"
  boot_wait            = "15s"
  disk_compression     = true
  disk_discard         = "unmap"
  arc                  = "x86_64"
  disk_interface       = "virtio"
  format               = "qcow2"
  net_device           = "virtio-net"
  config_folder        = "config/"
  ssh_username         = "root"
  ssh_password         = "L=hD6!rf<4x{[$^@rDt9wTbp8?28)}"
  ssh_wait_timeout     = "60m"
  cpu                  = "4"
  ram                  = "2048"
  iso_checksum_type    = "sha512"
  iso_10               = "https://cdimage.debian.org/cdimage/archive/10.13.0/amd64/iso-cd/debian-10.13.0-amd64-netinst.iso"
  iso_10_checksum      = "466add7fb5ba7caebd27bf6b8b326a24857295673045d643950869f5f0440c44ae833dea49c7b8a674afbf82c3f41ceb5062948aea443d581bc827db62cc5249"
  iso_11               = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso"
  iso_11_checksum      = "224cd98011b9184e49f858a46096c6ff4894adff8945ce89b194541afdfd93b73b4666b0705234bd4dff42c0a914fdb6037dd0982efb5813e8a553d8e92e6f51"
  iso_12               = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.0.0-amd64-netinst.iso"
  iso_12_checksum      = "b462643a7a1b51222cd4a569dad6051f897e815d10aa7e42b68adc8d340932d861744b5ea14794daa5cc0ccfa48c51d248eda63f150f8845e8055d0a5d7e58e6"
  iso_testing          = "https://cdimage.debian.org/cdimage/daily-builds/daily/20230422-3/amd64/iso-cd/debian-testing-amd64-netinst.iso"
  iso_testing_checksum = "c1917d3caf56446f9fd5f02d2be1c8071da3defef8ca05ef2a867c9e1ebbeac1b47fcca429b5cbeb2cd98dde920b0e689652e775124026a73987c5b5f226801d"
  config_file_base     = "preseed-base.cfg"
  config_file_xfce     = "preseed-xfce.cfg"
}

source "qemu" "base-10-x86_64" {
  vm_name          = "debian-10-x86_64.qcow2"
  output_directory = "${var.output_dir}debian-10-x86_64"
  disk_size        = "2000"
  boot_command     = [
    "<esc><wait>", "auto <wait>",
    "console-keymaps-at/keymap=us <wait>",
    "console-setup/ask_detect=false <wait>", "debconf/frontend=noninteractive <wait>",
    "fb=false <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=us <wait>",
    "locale=en_US <wait>", "netcfg/get_hostname=debian <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.config_folder}debian-10/http/${var.config_file_base} <wait>",
    "<enter><wait>"
  ]
  boot_wait        = var.boot_wait
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  disk_compression = var.disk_compression
  disk_discard     = var.disk_discard
  disk_interface   = var.disk_interface
  format           = var.format
  headless         = var.headless
  http_directory   = "."
  iso_checksum     = var.iso_10_checksum
  iso_urls         = [var.iso_10]
  net_device       = var.net_device
  qemuargs         = [["-m", "${var.ram}M"], ["-smp", "${var.cpu}"]]
  shutdown_command = "echo '${var.ssh_password}' | shutdown -P now"
  ssh_password     = var.ssh_password
  ssh_username     = var.ssh_username
  ssh_wait_timeout = var.ssh_wait_timeout
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
}

source "qemu" "base-11-x86_64" {
  vm_name          = "debian-11-x86_64.qcow2"
  output_directory = "${var.output_dir}debian-11-x86_64"
  disk_size        = "2000"
  boot_command     = [
    "<esc><wait>", "auto <wait>",
    "console-keymaps-at/keymap=us <wait>",
    "console-setup/ask_detect=false <wait>", "debconf/frontend=noninteractive <wait>",
    "fb=false <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=us <wait>",
    "locale=en_US <wait>", "netcfg/get_hostname=debian <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.config_folder}debian-11/http/${var.config_file_base} <wait>",
    "<enter><wait>"
  ]
  boot_wait        = var.boot_wait
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  disk_compression = var.disk_compression
  disk_discard     = var.disk_discard
  disk_interface   = var.disk_interface
  format           = var.format
  headless         = var.headless
  http_directory   = "."
  iso_checksum     = var.iso_11_checksum
  iso_urls         = [var.iso_11]
  net_device       = var.net_device
  qemuargs         = [["-m", "${var.ram}M"], ["-smp", "${var.cpu}"]]
  shutdown_command = "echo '${var.ssh_password}' | shutdown -P now"
  ssh_password     = var.ssh_password
  ssh_username     = var.ssh_username
  ssh_wait_timeout = var.ssh_wait_timeout
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
}

source "qemu" "xfce-11-x86_64" {
  vm_name          = "debian-11-xfce-x86_64.qcow2"
  output_directory = "${var.output_dir}debian-11-xfce-x86_64"
  disk_size        = "5000"
  boot_command     = [
    "<esc><wait>", "auto <wait>",
    "console-keymaps-at/keymap=us <wait>",
    "console-setup/ask_detect=false <wait>", "debconf/frontend=noninteractive <wait>",
    "fb=false <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=us <wait>",
    "locale=en_US <wait>", "netcfg/get_hostname=debian <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.config_folder}debian-11/http/${var.config_file_xfce} <wait>",
    "<enter><wait>"
  ]
  boot_wait        = var.boot_wait
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  disk_compression = var.disk_compression
  disk_discard     = var.disk_discard
  disk_interface   = var.disk_interface
  format           = var.format
  headless         = var.headless
  http_directory   = "."
  iso_checksum     = var.iso_11_checksum
  iso_urls         = [var.iso_11]
  net_device       = var.net_device
  qemuargs         = [["-m", "${var.ram}M"], ["-smp", "${var.cpu}"]]
  shutdown_command = "echo '${var.ssh_password}' | shutdown -P now"
  ssh_password     = var.ssh_password
  ssh_username     = var.ssh_username
  ssh_wait_timeout = var.ssh_wait_timeout
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
}

source "qemu" "base-12-x86_64" {
  vm_name          = "debian-12-x86_64.qcow2"
  output_directory = "${var.output_dir}debian-12-x86_64"
  disk_size        = "2000"
  boot_command     = [
    "<esc><wait>", "auto <wait>",
    "console-keymaps-at/keymap=us <wait>",
    "console-setup/ask_detect=false <wait>", "debconf/frontend=noninteractive <wait>",
    "fb=false <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=us <wait>",
    "locale=en_US <wait>", "netcfg/get_hostname=debian <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.config_folder}debian-12/http/${var.config_file_base} <wait>",
    "<enter><wait>"
  ]
  boot_wait        = var.boot_wait
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  disk_compression = var.disk_compression
  disk_discard     = var.disk_discard
  disk_interface   = var.disk_interface
  format           = var.format
  headless         = var.headless
  http_directory   = "."
  iso_checksum     = var.iso_12_checksum
  iso_urls         = [var.iso_12]
  net_device       = var.net_device
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
  sources = [
    "source.qemu.base-10-x86_64", "source.qemu.base-11-x86_64", "source.qemu.xfce-11-x86_64",
    "source.qemu.base-12-x86_64"
  ]

  provisioner "ansible" {
    only             = ["qemu.base-10-x86_64"]
    ansible_env_vars = [
      "ANSIBLE_SSH_ARGS='-o ControlMaster=no -o ControlPersist=180s -o ServerAliveInterval=120s -o TCPKeepAlive=yes'"
    ]
    playbook_file = "./${var.config_folder}debian-10/ansible/tasks.yml"
  }

  provisioner "ansible" {
    only             = ["qemu.base-11-x86_64", "qemu.xfce-11-x86_64"]
    ansible_env_vars = [
      "ANSIBLE_SSH_ARGS='-o ControlMaster=no -o ControlPersist=180s -o ServerAliveInterval=120s -o TCPKeepAlive=yes'"
    ]
    playbook_file = "./${var.config_folder}debian-11/ansible/tasks.yml"
  }

  provisioner "ansible" {
    only             = ["qemu.base-12-x86_64"]
    ansible_env_vars = [
      "ANSIBLE_SSH_ARGS='-o ControlMaster=no -o ControlPersist=180s -o ServerAliveInterval=120s -o TCPKeepAlive=yes'"
    ]
    playbook_file = "./${var.config_folder}debian-12/ansible/tasks.yml"
  }
}