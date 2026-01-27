{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.kekleo.graphical {
    programs.firefox.enable = true;
  };
}
