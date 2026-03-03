{
  config,
  osConfig ? null,
  lib,
  ...
}:
let
  mkDefaultSharedAttrs =
    base: defaults: lib.mapAttrs (_: v: lib.mkDefault v) (lib.filterAttrs (k: _: base ? ${k}) defaults);
in
{
  imports = [
    ./git.nix
    ./fish.nix
    ./nixvim
    ./hyprland.nix
    ./kitty.nix
    ./rofi
  ];

  kekleo = lib.mkIf (osConfig != null) (mkDefaultSharedAttrs config.kekleo (osConfig.kekleo or { }));

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
