{ pkgs, ... }:
{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland.enable = true;

    settings = {
      monitor = [
        ",preferred,auto,1"
      ];
      "$mod" = "SUPER";
      bind = [
        "ALT,Return,exec,kitty"
        "ALTSHIFT,Q,killactive,"
        "ALT,V,togglefloating,"
        "ALT,F,fullscreen,0"
        "$mod,F,exec,firefox"
      ];
    };
  };
}
