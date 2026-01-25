{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    (import ../base.nix { inherit inputs outputs; })
    ./hardware-configuration.nix
  ];

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable firmware
  #hardware.enableAllFirmware = true;

  # Enable bluetooth
  #hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  networking.hostName = "desktop";
}
