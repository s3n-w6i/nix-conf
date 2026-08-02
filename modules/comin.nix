{
  comin,
  ...
}:

{
  imports = [
    comin.nixosModules.comin
  ];

  services.comin = {
    enable = true;
    remotes = [
      {
        name = "origin";
        url = "git@github.com:s3n-w6i/nix-conf";
        branches.main.name = "master";
        auth.ssh_deploy_key_path = "/home/admin/.ssh/id_ed25519";
      }
    ];
    gpgPublicKeyPaths = [
      # TODO
    ];
  };
}
