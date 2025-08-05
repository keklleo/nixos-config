{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-credential-oauth
  ];

  programs.git = {
    enable = true;
    userName = "Leonhard Kost";
    userEmail = "leonhard.kost@gmail.com";
    extraConfig = {
      credential.helper = "oauth";
    };
  };
}
