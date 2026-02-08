{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}:
let
  dyndnsScript = pkgs.writeScript "dyndns.py" (builtins.readFile ./dyndns.py);
in
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
    ./hardware-configuration.nix
    ./secrets
    inputs.agenix.nixosModules.default
  ];

  users.groups.dyndns = { };
  users.users = {
    leonhard = {
      initialPassword = "leonhard";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = config.kekleo.publicKeys;
    };
    dyndns = {
      isSystemUser = true;
      group = "dyndns";
      packages = [ pkgs.python313Packages.nc-dnsapi ];
    };
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
      set -eu
      ${pkgs.python313}/bin/python3 ${dyndnsScript}
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "dyndns";
    };
  };

  networking = {
    hostName = "server";
    interfaces.eno1 = {
      ipv4.addresses = [
        {
          address = "192.168.178.210";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.178.1";
      interface = "eno1";
    };
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 5432 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "leonhard" ];
    };
  };

  kekleo.graphical = false;
  kekleo.publicKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPegeAIABaY9DyWumihNZBlzfdduycvurwYYqoZrdkov2pRVJt8eFhXe+5tdLTKiAq58yzkJ6Zj3CuYb3XuQxX/aDvY4covDXjn1tGKf32xkhTuLd9eDGbFishiC+qROp2/3eZ01DwuttHWo3n/jwOwL3M9mw9Now2i2qaTGuq8wfG5XJ9Cp2+3Ly+mChhtff7Us65dWihNbR3k2WLLvdPJ2HMjeZder0u/IsTTGJj/sytEGt0LPqFOJMl0QuqemkzbeoSAEpVl4huXp5LVT7be2UUmRuekg0p2+EopHunMhUaf7dekiupbKFFNY8aU/eOEZmnakJpOEhcZWaFot825O8jViC9I0NTLazgwttqnZxnuFIp/0Ljf0j7SR/tJa55T0yMH5pyEjw/yvYLplJKbBlPyl2LpsN37l5HKXFtunOsiK/NLL6rLUoTjO5QGCg750c2UKqL8A1g11sW82kscePQTFKbIRmr271ruFWaxnNNh2W5LuJNcUlLf/t/6ps= leonhard@LeonhardsPC"
  ];
}
