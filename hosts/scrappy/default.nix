{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ../../modules/nixos/power.nix
  ];

  networking.hostName = "scrappy";
}
