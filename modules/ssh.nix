{
  services.openssh = {
    enable = true;
    ports = [ 23 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      ChallengeResponseAuthentication = false;
      PermitEmptyPasswords = false;
      # AllowUsers is configured in the users configs
      PermitRootLogin = "no";
    };
  };
}
