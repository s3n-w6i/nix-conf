{
  comin,
}:
comin.nixosModules.comin {
  services.comin = {
    enable = true;
    remotes = [
      {
        name = "origin";
        url = "https://github.com/s3n-w6i/nix-conf";
        branches.main.name = "master";
      }
    ];
    gpgPublicKeyPaths = [
      # TODO
    ];
  };
}
