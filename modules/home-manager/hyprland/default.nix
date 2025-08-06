{ pkgs, ... }:
{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland =
    let
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      workspaces = builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = toString (i + 1);
          in
          [
            "ALT, ${ws}, workspace, ${ws}"
            "ALTSHIFT, ${ws}, movetoworkspace, ${ws}"
          ]
        ) 9
      );
    in
    {
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
          "ALT,F,fullscreen,1"
          "ALTSHIFT,F,fullscreen,0"
          "$mod,F,exec,firefox"

          "ALT,H,movefocus,l"
          "ALT,L,movefocus,r"
          "ALT,K,movefocus,u"
          "ALT,J,movefocus,d"
          "ALTSHIFT,H,movewindow,l"
          "ALTSHIFT,L,movewindow,r"
          "ALTSHIFT,K,movewindow,u"
          "ALTSHIFT,J,movewindow,d"
        ] ++ workspaces;

        decoration = {
          rounding = 8;
        };
        animations.animation = [
          "windows,1,4,default"
          "border,1,5,default"
          "fadeIn,1,5,default"
          "workspaces,1,3,default"
        ];
      };
    };
}
