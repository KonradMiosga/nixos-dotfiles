{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ../../modules/nixos/power.nix
  ];

  home-manager.users.copperplate.imports = [
    ./packages.nix
  ];

  networking.hostName = "scrappy";
}
