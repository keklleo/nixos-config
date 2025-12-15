{
  programs.nixvim = {
    opts.completeopt = [
      "menu"
      "menuone"
      "noselect"
    ];

    plugins = {
      lspkind = {
        enable = true;
        settings.mode = "symbol";
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          formatting.fields = [
            "abbr"
            "kind"
            "menu"
          ];

          mapping = {
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-l>" = ''
              cmp.mapping(function()
                            if luasnip.expand_or_locally_jumpable() then
                              luasnip.expand_or_jump()
                            end
                          end, {'i', 's'})'';
            "<C-h>" = ''
              cmp.mapping(function()
                            if luasnip.locally_jumpable(-1) then
                              luasnip.jump(-1)
                            end
                          end, {'i', 's'})'';
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "nvim_lsp_signature_help"; }
            { name = "path"; }
          ];
        };
      };
    };
  };
}
