{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
    ../../nixos/server/config.nix
  ];

  home = {
    username = "leonhard";
    homeDirectory = "/home/leonhard";
  };
}
