{
  config,
  ...
}:
{
  sops.secrets.dyndns = {
    format = "dotenv";
    sopsFile = ./dyndns.env;
    mode = "0400";
    owner = config.systemd.services.dyndns.serviceConfig.User;
  };
}
