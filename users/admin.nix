{
  users.users.admin = {
    isNormalUser = true;
    home = "/home/admin";
    # allow admin to use sudo and docker
    extraGroups = [
      "wheel"
      "docker"
    ];
    # change initial password using the passwd command
    initialPassword = "admin";
    openssh.authorizedKeys.keys = [
      # change this to your ssh key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtEHZiEcmqKY3McJYMGJ3KKdzJ0YrmcmDpnjYUvf5vd s3n-w6i@nixos"
    ];
  };

  nix.settings.trusted-users = [
    "admin"
  ];

  services.openssh.settings.AllowUsers = [ "admin" ];
}
