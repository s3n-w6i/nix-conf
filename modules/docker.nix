{ pkgs, ... }:

{
  # Runtime
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    logDriver = "journald";
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  # Enable lingering for docker container running user, otherwise containers don't respond when not logged in
  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/admin"
  ];

  # Allow binding ports 80 and 443 because we want to run traefik as a docker container
  # security.wrappers = {
  #   docker-rootlesskit = {
  #     owner = "root";
  #     group = "root";
  #     capabilities = "cap_net_bind_service+ep";
  #     source = "${pkgs.rootlesskit}/bin/rootlesskit";
  #   };
  # };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  # networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  # Enable auto-updates for containers
  # https://docs.podman.io/en/latest/markdown/podman-auto-update.1.html
  # systemd.timers."podman-auto-update".wantedBy = [ "timers.target" ];
}
