{ user, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 23 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      ChallengeResponseAuthentication = false;
      PermitEmptyPasswords = false;
      AllowUsers = [ user ];
      PermitRootLogin = "no";
    };
  };
}
