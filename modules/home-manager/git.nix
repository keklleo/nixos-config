{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Leonhard Kost";
      user.email = "leonhard.kost@gmail.com";
      credential.credentialStore = "cache";
      credential.helper = "manager";
    };
  };
}
