{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    colorschemes.tokyonight.enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      showmode = false;

      breakindent = true;

      undofile = true;

      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";

      updatetime = 250;
      timeoutlen = 300;

      splitright = true;
      splitbelow = true;

      list = true;
      listchars = { tab = "» "; trail = "·"; nbsp = "␣"; };

      inccommand = "split";

      cursorline = true;

      scrolloff = 10;

      confirm = true;
    };

    keymaps = [
      {
        mode = "n";
	key = "<Esc>";
	action = "<cmd>nohlsearch<CR>";
	options.silent = true;
      }

      {
        mode = "n";
	key = "<C-h>";
	action = "<C-w><C-h>";
	options.desc = "Move focus to the left window";
      }
      {
        mode = "n";
	key = "<C-l>";
	action = "<C-w><C-l>";
	options.desc = "Move focus to the right window";
      }
      {
        mode = "n";
	key = "<C-k>";
	action = "<C-w><C-k>";
	options.desc = "Move focus to the upper window";
      }
      {
        mode = "n";
	key = "<C-j>";
	action = "<C-w><C-j>";
	options.desc = "Move focus to the lower window";
      }
    ];

    plugins.lz-n.enable = true;

    plugins.nvim-autopairs = {
      enable = true;
      lazyLoad = {
        enable = true;
	settings.event = "InsertEnter";
      };
    };

    plugins.indent-blankline.enable = true;

    plugins.lualine = {
      enable = true;
      settings = {
	options = { section_separators = ""; component_separators = ""; };
	sections = {
	  lualine_b = [ { __unkeyed-1 = "branch"; icon = ""; } ];
	  lualine_c = [ "filename" ];
	  lualine_x = [ "filetype" ];
	};
      };
    };

    plugins.treesitter = {
      enable = true;
      settings = {
	auto_install = true;
	highlight.enable = true;
	indent.enable = true;
      };
    };

    plugins.which-key = {
      enable = true;
      lazyLoad = {
        enable = true;
	settings.event = "VimEnter";
      };
    };

    extraPackages = with pkgs; [
      gcc
    ];

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
    ];
  };
}
