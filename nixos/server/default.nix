{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
    ./hardware-configuration.nix
  ];

  users.users = {
    leonhard = {
      initialPassword = "leonhard";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  networking.hostName = "server";
}
