{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.bootdev-cli
    calibre
    go
    xxd
  ];
}
