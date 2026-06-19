{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    alacritty
    codex
    fuzzel
    gcc
    git
    nil
    nixpkgs-fmt
    noctalia-shell
    nodejs
    playerctl
    ripgrep
    tree
    vim
    wget
    xcursor-themes
  ];
}
