{
  nixpkgs,
  comin,
  disko,
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  specialArgs = {
    inherit nixpkgs comin disko;
  };

  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./disko.nix
    ../../modules/comin.nix
  ];
}
