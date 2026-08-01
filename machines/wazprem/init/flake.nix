{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      comin,
    }:
    {
      nixosConfigurations = {
        wazprem = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ../../../common/init/comin-module.nix
          ];

          specialArgs = {
            inherit
              comin
              ; # add all parameters that are not passed by default (only pkgs, config, lib, ... are)
          };
        };
      };
    };
}
