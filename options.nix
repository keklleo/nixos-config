{
  config,
  lib,
  ...
}:
{
  options.kekleo = with lib.types; {
    publicKeys = lib.mkOption {
      type = listOf str;
      default = [ ];
      description = "List of public keys to use for ssh login, secret encryption, etc.";
    };
    graphical = lib.mkOption {
      type = bool;
      default = true;
      description = "Enable GUI features and programs";
    };
    neovim = lib.mkOption {
      type = bool;
      default = true;
      description = "Enable neovim";
    };
  };

  config.home-manager.sharedModules = [
    {
      kekleo.publicKeys = lib.mkDefault config.kekleo.publicKeys;
      kekleo.graphical = lib.mkDefault config.kekleo.graphical;
      kekleo.neovim = lib.mkDefault config.kekleo.neovim;
    }
  ];
}
