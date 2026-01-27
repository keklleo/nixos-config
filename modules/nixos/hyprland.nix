{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.kekleo.graphical {
    programs.hyprland.enable = true;
  };
}
