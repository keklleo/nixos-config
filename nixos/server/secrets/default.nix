{
  config,
  pkgs,
  ...
}:
let
  keys = builtins.map (
    key: builtins.toString (pkgs.writeText "agenix-key" key)
  ) config.kekleo.publicKeys;
in
{
  age.identityPaths = keys;
  age.secrets.nc_customer = {
    file = ./nc_customer.age;
    owner = "dyndns";
  };
  age.secrets.nc_api_password = {
    file = ./nc_api_password.age;
    owner = "dyndns";
  };
  age.secrets.nc_api_key = {
    file = ./nc_api_key.age;
    owner = "dyndns";
  };
}
