{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
  ];

  home = {
    username = "leonhard";
    homeDirectory = "/home/leonhard";
  };

  kekleo.graphical = false;
}
