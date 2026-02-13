{
  inputs,
  outputs,
  config,
  ...
}:
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
    ./hardware-configuration.nix
    ./config.nix
    inputs.sops-nix.nixosModules.sops
    ./secrets
    ./dyndns
  ];

  users.users.leonhard = {
    initialPassword = "leonhard";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = config.kekleo.publicKeys;
  };

  networking = {
    hostName = "server";
    firewall.enable = false;
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
}
