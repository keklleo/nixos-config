{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fishPlugins.tide
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # no greeting
      set fish_greeting
      # vi key binds
      set -g fish_key_bindings fish_vi_key_bindings
      # accept completion with ctrl-y
      bind --mode insert \cy forward-char
      # initialize prompt
      tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Few icons' --transient=Yes
    '';
    shellAbbrs = {
      la = "ls -lahH";
    };
  };
}
