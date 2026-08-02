{
  nixpkgs,
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  specialArgs = {
    inherit nixpkgs;
  };

  modules = [
    ./configuration.nix
    ./disko.nix
    ../../modules/comin.nix
  ];
}
