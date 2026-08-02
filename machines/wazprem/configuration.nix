{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./file-shares.nix
    ../../modules/docker.nix
    ../../modules/fail2ban.nix
    ../../modules/minimal.nix
    ../../modules/ssh.nix
    ../../modules/timezone.nix
    ../../modules/nix/nix-command-flakes.nix
    ../../modules/nix/optimise-gc.nix
    ../../users/admin.nix
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

  system.stateVersion = "26.05"; # never change this

  networking.hostName = "wazprem";

  nix.settings.trusted-users = [
    "root"
  ];

}
