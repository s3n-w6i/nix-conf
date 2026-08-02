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
        url = "https://github.com/s3n-w6i/nix-conf";
        branches.main.name = "master";
        # auth.ssh_deploy_key_path = "/home/admin/.ssh/id_ed25519"; # this does not yet seem functional, so using access_token_path instead
        auth.access_token_path = "/home/admin/secrets/github_access_token";
      }
    ];
    gpgPublicKeyPaths = [
      # TODO
    ];
  };
}
