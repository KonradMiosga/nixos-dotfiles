{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    codex
    fuzzel
    gcc
    neovim
    nil
    nixpkgs-fmt
    noctalia-shell
    nodejs
    ripgrep
    xcursor-themes
  ];
}
