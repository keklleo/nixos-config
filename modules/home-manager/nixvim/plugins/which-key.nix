{
  programs.nixvim.plugins.which-key = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings.event = "VimEnter";
    };
  };
}
