{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.kekleo.exegol = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether to enable exegol.";
  };

  config = lib.mkIf config.kekleo.exegol {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = [ "leonhard" ];
    environment.systemPackages = with pkgs; [ exegol4 ];
  };
}
