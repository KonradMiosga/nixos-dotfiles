{ pkgs, ... }: {
  home.packages = with pkgs; [
    bootdev-cli
  ];
}
