source "qemu" "server-2019-standard" {
  disk_size    = "13000"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-server-2019-standard/files/*", "./config/windows-shared/scripts/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2019-standard"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2019},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2019-standard/windows-server-2019-standard.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2019-standard.qcow2"

  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2019_checksum
  iso_urls         = [var.windows_iso_2019]
  shutdown_timeout = var.shutdown_timeout
  format           = var.qemu_format
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
  winrm_insecure   = var.winrm_insecure
  winrm_password   = var.windows_password
  winrm_timeout    = var.winrm_timeout
  winrm_use_ssl    = var.winrm_use_ssl
  winrm_username   = var.windows_user
}

source "qemu" "server-2019-datacenter" {
  disk_size    = "13000"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-server-2019-datacenter/files/*", "./config/windows-shared/scripts/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2019-datacenter"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2019},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2019-datacenter/windows-server-2019-datacenter.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2019-datacenter.qcow2"

  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2019_checksum
  iso_urls         = [var.windows_iso_2019]
  shutdown_timeout = var.shutdown_timeout
  format           = var.qemu_format
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
  winrm_insecure   = var.winrm_insecure
  winrm_password   = var.windows_password
  winrm_timeout    = var.winrm_timeout
  winrm_use_ssl    = var.winrm_use_ssl
  winrm_username   = var.windows_user
}

source "qemu" "server-2022-standard" {
  disk_size    = "12000"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-server-2022-standard/files/*", "./config/windows-shared/scripts/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2022-standard"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2022},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2022-standard/windows-server-2022-standard.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2022-standard.qcow2"

  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2022_checksum
  iso_urls         = [var.windows_iso_2022]
  shutdown_timeout = var.shutdown_timeout
  format           = var.qemu_format
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
  winrm_insecure   = var.winrm_insecure
  winrm_password   = var.windows_password
  winrm_timeout    = var.winrm_timeout
  winrm_use_ssl    = var.winrm_use_ssl
  winrm_username   = var.windows_user
}

source "qemu" "server-2022-datacenter" {
  disk_size    = "12000"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-server-2022-datacenter/files/*", "./config/windows-shared/scripts/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2022-datacenter"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2022},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2022-datacenter/windows-server-2022-datacenter.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2022-datacenter.qcow2"

  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2022_checksum
  iso_urls         = [var.windows_iso_2022]
  shutdown_timeout = var.shutdown_timeout
  format           = var.qemu_format
  vnc_bind_address = var.vnc_bind_address
  vnc_port_min     = var.vnc_port_min
  vnc_port_max     = var.vnc_port_max
  winrm_insecure   = var.winrm_insecure
  winrm_password   = var.windows_password
  winrm_timeout    = var.winrm_timeout
  winrm_use_ssl    = var.winrm_use_ssl
  winrm_username   = var.windows_user
}

build {
  sources = ["source.qemu.server-2019-standard", "source.qemu.server-2022-standard","source.qemu.server-2019-datacenter", "source.qemu.server-2022-datacenter"]

  provisioner "windows-shell" {
    inline = [
      "dism /online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0 /NoRestart"
    ]
    valid_exit_codes = [0, 3010]
    only = ["qemu.server-2019-standard", "qemu.server-2019-datacenter"]
  }

  provisioner "windows-shell" {
    inline = ["powershell.exe a:\\edge.ps1"]
    only = ["qemu.server-2019-standard", "qemu.server-2019-datacenter"]
  }

  provisioner "powershell" {
    scripts = ["./config/windows-shared/scripts/debloat-windows.ps1"]
  }

  provisioner "windows-restart" {
    restart_timeout = "${var.restart_timeout}"
  }

  provisioner "windows-shell" {
    inline = [
      "reg add \"HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU\" /v AUOptions /t REG_DWORD /d 7 /f"
    ]
  }

  provisioner "windows-shell" {
    execute_command = "{{ .Vars }} cmd /c \"{{ .Path }}\""
    scripts         = [
      "./config/windows-shared/scripts/set-winrm-automatic.bat", "./config/windows-shared/scripts/compact.bat"
    ]
  }

  provisioner "powershell" {
    scripts = ["./config/windows-shared/scripts/cleanup.ps1"]
  }

}