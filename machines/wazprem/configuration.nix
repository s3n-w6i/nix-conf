{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/docker.nix
    ../../modules/fail2ban.nix
    ../../modules/minimal.nix
    ../../modules/ssh.nix
    ../../modules/nix/nix-command-flakes.nix
    ../../modules/nix/optimise-gc.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.admin = {
    isNormalUser = true;
    home = "/home/admin";
    extraGroups = [ "wheel" "docker" ]; # allow admin to use sudo and docker
    initialPassword = "admin";
    openssh.authorizedKeys.keys = [
      # change this to your ssh key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtEHZiEcmqKY3McJYMGJ3KKdzJ0YrmcmDpnjYUvf5vd simon@nixos"
    ];
  };

  system.stateVersion = "24.11";

  nix.settings.trusted-users = [ "root" "admin" ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [ 443 ];
  };

}
