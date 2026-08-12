{
  nixpkgs,
  agenix,
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
    ../../modules/agenix.nix
    ../../modules/comin.nix
    ./disko.nix
  ];
}
