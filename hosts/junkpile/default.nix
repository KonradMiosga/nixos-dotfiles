{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
  ];

  networking.hostName = "junkpile";

  programs.steam.enable = true;

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];
}
