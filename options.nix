{
  lib,
  ...
}:
{
  options.kekleo = with lib.types; {
    domain = lib.mkOption {
      type = str;
      default = "";
      description = "Domain of the device.";
    };
    publicKeys = lib.mkOption {
      type = listOf str;
      default = [ ];
      description = "List of public keys to use for ssh login, secret encryption, etc.";
    };
    graphical = lib.mkOption {
      type = bool;
      default = true;
      description = "Whether to enable GUI features and programs.";
    };
  };
}
