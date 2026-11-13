{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
  ];

  home-manager.users.copperplate.imports = [
    ./packages.nix
  ];

  networking.hostName = "junkpile";

  programs.steam.enable = true;

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];
}
