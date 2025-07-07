{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    userName = "Leonhard Kost";
    userEmail = "leonhard.kost@gmail.com";
    extraConfig = {
      credential.helper = "manager";
      credential.credentialStore = "secretservice";
    };
  };
}
