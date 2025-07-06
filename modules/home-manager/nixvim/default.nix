{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    colorschemes.tokyonight.enable = true;

    globals.mapleader = " ";
  };
}
