{
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
      python3 -c "${builtins.readFile ./dyndns.py}"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "dyndns";
    };
  };
}
