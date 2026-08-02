# Installation

Run `nixos-generate-config --root /tmp/config --no-filesystems` and commit the resulting `hardware-configuration.nix` in `/tmp/config/etc/nixos` into this folder.

Run `lsblk` to find the device for use as the main disk (e.g. `/dev/sda`). Then install in NixOS minimal installer using:

```bash
sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake github.com:s3n-w6i/nix-conf#wazprem --disk main /dev/<device-name-of-disk-to-use-for-main>
```

If you run into no space left on device, remove the old data with `nix-collect-garbage --delete-old`, resize the temporary file system `sudo mount -o remount,size=10G,noatime /nix/.rw-store` and try again. See https://discourse.nixos.org/t/error-installing-with-disko-no-space-left/61124/2.
