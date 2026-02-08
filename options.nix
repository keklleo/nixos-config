{
  lib,
  ...
}:
{
  options.kekleo = {
    graphical = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable GUI features and programs";
    };
    neovim = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable neovim";
    };
  };
}
