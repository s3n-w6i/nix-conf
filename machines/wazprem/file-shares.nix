{ config, ... }:

{
  # Load credentials into secrets file
  age.secrets.waznasSmbCredentials = {
    file = ../../secrets/wazprem/admin/waznas-smb-credentials.age;
    owner = "admin";
    group = "users";
  };

  # For the uploads folder
  fileSystems."/mnt/waznas/Multimedia-Uploads" = {
    device = "//192.168.2.111/Multimedia-Uploads";
    fsType = "cifs";

    options = [
      "credentials=${config.age.secrets.waznasSmbCredentials.path}"
      "uid=1000"
      "gid=100"
      "file_mode=0644"
      "dir_mode=0755"
      "x-systemd.automount" # mount upon first use
      "noauto" # do not stall boot
      "_netdev"
    ];
  };
  # For the read-only image library
  fileSystems."/mnt/waznas/Multimedia" = {
    device = "//192.168.2.111/Multimedia";
    fsType = "cifs";

    options = [
      "credentials=${config.age.secrets.waznasSmbCredentials.path}"
      "uid=1000"
      "gid=100"
      "file_mode=0444"
      "dir_mode=0555"
      "x-systemd.automount" # mount upon first use
      "noauto" # do not stall boot
      "_netdev"
    ];
  };
}
