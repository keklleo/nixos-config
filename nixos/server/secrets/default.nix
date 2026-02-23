{
  config,
  ...
}:
{
  imports = [
    ./secret-config.nix
  ];

  sops.secrets.dyndns = {
    format = "dotenv";
    sopsFile = ./dyndns.env;
    owner = config.systemd.services.dyndns.serviceConfig.User;
  };
}
