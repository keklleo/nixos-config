{
  config,
  pkgs,
  ...
}:
{
  users.groups.dyndns = { };
  users.users.dyndns = {
    isSystemUser = true;
    group = "dyndns";
    packages = [ pkgs.python313Packages.nc-dnsapi ];
  };

  systemd.timers."dyndns" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "dyndns.service";
    };
  };

  systemd.services."dyndns" = {
    script = ''
      NC_CUSTOMER=${"$(cat " + config.age.secrets.nc_customer.path + ")"}
      NC_API_PASSWORD=${"$(cat " + config.age.secrets.nc_api_password.path + ")"}
      NC_API_KEY=${"$(cat " + config.age.secrets.nc_api_key.path + ")"}
      NC_DOMAIN=${"$(cat " + config.age.secrets.nc_domain.path + ")"}
      python3 -c "${builtins.readFile ./dyndns.py}"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "dyndns";
    };
  };
}
