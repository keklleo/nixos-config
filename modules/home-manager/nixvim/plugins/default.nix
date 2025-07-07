{ pkgs, ... }: {
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./fmt.nix
    ./treesitter.nix
    ./lualine.nix
    ./nvim-autopairs.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    plugins = {
      lz-n.enable = true;
      indent-blankline.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
    ];
  };
}
