{ ... }: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    env = { EDITOR = "nvim"; };
  };
}
