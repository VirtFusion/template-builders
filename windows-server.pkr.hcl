variables {
  vnc_bind_address               = "0.0.0.0"
  vnc_port_max                   = "5920"
  vnc_port_min                   = "5920"
  winrm_timeout                  = "12h"
  winrm_use_ssl                  = "true"
  winrm_insecure                 = "true"
  accelerator                    = "kvm"
  headless                       = "true"
  restart_timeout                = "5m"
  shutdown_timeout               = "15m"
  output_dir                     = "../output"
  windows_user                   = "Administrator"
  windows_password               = "SVDMV#tcV2MWrr#WUZMv"
  windows_virtio_driver          = "./source/virtio-win.iso"
  ssh_winrm_host_port            = "2299"
  windows_cpus                   = "4"
  windows_memory                 = "3072"
  windows_iso_2019_eval          = "./source/windows-server-2019-eval.iso"
  windows_iso_2019_eval_checksum = "sha256:549bca46c055157291be6c22a3aaaed8330e78ef4382c99ee82c896426a1cee1"
  windows_iso_2019               = "./source/windows-server-2019.iso"
  windows_iso_2019_checksum      = "sha256:22aa0271bdbf9f41283d5960b10506d015c9de6dbff5e3430cea2a22c687576f"
  windows_iso_2022               = "./source/windows-server-2022.iso"
  windows_iso_2022_checksum      = "sha256:94ad1fdddc89e180e79dc679bc8a9efc87b32b3d01c9e36841ba7cd589761eb6"
  windows_iso_2022_eval          = "./source/windows-server-2022-eval.iso"
  windows_iso_2022_eval_checksum = "sha256:4f1457c4fe14ce48c9b2324924f33ca4f0470475e6da851b39ccbf98f44e7852"
  qemu_disk_cache                = "writeback"
  qemu_format                    = "qcow2"
}

source "qemu" "server-2019-standard" {
  disk_size    = "14000"
  communicator = "winrm"

  floppy_files = [
    "./config/windows-shared/scripts/*",
    "./config/windows-server-2019-standard/files/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2019-standard"

  qemuargs = [
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

source "qemu" "server-2019-standard-eval" {
  disk_size    = "14000"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-shared/scripts/*",
    "./config/windows-server-2019-standard-eval/files/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2019-standard-eval"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2019_eval},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2019-standard-eval/windows-server-2019-standard-eval.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2019-standard-eval.qcow2"
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2019_eval_checksum
  iso_urls         = [var.windows_iso_2019_eval]
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

source "qemu" "server-2022-standard-eval" {
  disk_size    = "12500"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-shared/scripts/*",
    "./config/windows-server-2022-standard-eval/files/*",
    "./config/windows-shared/patches/cloudinit/windows.py"
  ]
  output_directory = "${var.output_dir}/windows-server-2022-standard-eval"
  qemuargs         = [
    ["-m", "${var.windows_memory}M"], ["-smp", var.windows_cpus],
    ["-drive", "file=${var.windows_iso_2022_eval},media=cdrom,index=2"],
    ["-drive", "file=${var.windows_virtio_driver},media=cdrom,index=3"], [
      "-drive",
      "file=${var.output_dir}/windows-server-2022-standard-eval/windows-server-2022-standard-eval.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1"
    ]
  ]
  shutdown_command = "a:/sysprep.bat"
  vm_name          = "windows-server-2022-standard-eval.qcow2"
  disk_cache       = var.qemu_disk_cache
  accelerator      = var.accelerator
  headless         = var.headless
  iso_checksum     = var.windows_iso_2022_eval_checksum
  iso_urls         = [var.windows_iso_2022_eval]
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
  disk_size    = "12500"
  communicator = "winrm"
  floppy_files = [
    "./config/windows-shared/scripts/*",
    "./config/windows-server-2022-standard/files/*",
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

build {
  sources = [
    "source.qemu.server-2019-standard",
    "source.qemu.server-2019-standard-eval",
    "source.qemu.server-2022-standard",
    "source.qemu.server-2022-standard-eval"
  ]

  provisioner "windows-shell" {
    inline = [
      "dism /online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0 /NoRestart"
    ]
    valid_exit_codes = [0, 3010]
    only             = [
      "qemu.server-2019-standard",
      "qemu.server-2019-standard-eval"
    ]
  }

  provisioner "powershell" {
    scripts = ["./config/windows-shared/scripts/debloat-windows.ps1"]
  }

  provisioner "windows-restart" {
    restart_timeout = "${var.restart_timeout}"
  }

  provisioner "windows-shell" {
    inline = ["powershell.exe a:\\edge.ps1"]
    only   = [
      "qemu.server-2019-standard",
      "qemu.server-2019-standard-eval"
    ]
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