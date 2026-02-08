{
  config,
  lib,
  ...
}:
{
  imports = [
    ./git.nix
    ./fish.nix
    ./nixvim
    ./hyprland.nix
    ./kitty.nix
    ./rofi
  ];

  config.home-manager.sharedModules = [
    {
      kekleo.publicKeys = lib.mkDefault config.kekleo.publicKeys;
      kekleo.graphical = lib.mkDefault config.kekleo.graphical;
      kekleo.neovim = lib.mkDefault config.kekleo.neovim;
    }
  ];
}
