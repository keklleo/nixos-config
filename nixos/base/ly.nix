{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.kekleo.graphical {
    services.displayManager.ly.enable = true;
  };
}
