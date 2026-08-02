{
  description = "Configuration for server machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      comin,
      disko,
      ...
    }:
    {
      nixosConfigurations = {
        wazprem = import ./machines/wazprem { inherit nixpkgs comin disko; };
      };
    };
}
