{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
  ];

  networking.hostName = "junkpile";
}
