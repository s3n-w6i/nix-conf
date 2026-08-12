let
  # Users
  wazpremAdmin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIoXRdo6Y6f3N0W6t1XzIrRqQ3azVhPX2tqnr3Hk6e3X admin@wazprem";

  # Systems
in
{
  "wazprem/admin/waznas-smb-credentials.age".publicKeys = [wazpremAdmin];
}
