{
  description = "Configuration for server machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations = {
      wazprem = import ./machines/wazprem { inherit nixpkgs; };
    };
  };
}
