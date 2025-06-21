{ ... }: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    colorscheme = "tokyonight";
    colorschemes.tokyonight.enable = true;

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
  };
}
