{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gr" = "references";
            "gI" = "implementation";
            "<leader>ca" = "code_action";
            "<leader>D" = "type_definition";
            "<leader>rn" = "rename";
          };
        };

        servers = {
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
        };
      };
      lsp-format = {
        enable = true;
      };
    };
  };
}
