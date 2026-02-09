{
  config,
  pkgs,
  ...
}:
let
  pyenv = pkgs.python3.withPackages (ps: with ps; [ nc-dnsapi ]);
in
{
  users.groups.dyndns = { };
  users.users.dyndns = {
    isSystemUser = true;
    group = "dyndns";
  };

  systemd.timers."dyndns" = {
    requires = [ "network-online.target" ];
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "dyndns.service";
    };
  };

  systemd.services."dyndns" = {
    script = ''
      NC_CUSTOMER=${"$(cat " + config.age.secrets.nc_customer.path + ")"} \
      NC_API_PASSWORD=${"$(cat " + config.age.secrets.nc_api_password.path + ")"} \
      NC_API_KEY=${"$(cat " + config.age.secrets.nc_api_key.path + ")"} \
      NC_DOMAIN=${"$(cat " + config.age.secrets.nc_domain.path + ")"} \
      ${pyenv.interpreter} ${./dyndns.py}
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "dyndns";
    };
  };
}
