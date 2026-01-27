{
  config,
  lib,
  ...
}:
{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins
  ];

  config = lib.mkIf config.kekleo.neovim {
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      colorschemes.tokyonight.enable = true;

      clipboard.providers.wl-copy.enable = true;

      globals.mapleader = " ";
    };
  };
}
