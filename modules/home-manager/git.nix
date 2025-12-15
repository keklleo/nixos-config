{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-credential-oauth
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Leonhard Kost";
      user.email = "leonhard.kost@gmail.com";
      credential.helper = [
        "cache --timeout 21600"
        "oauth" # Eventually with optional -device flag
      ];
    };
  };
}
