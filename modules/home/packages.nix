{
  pkgs,
  qml-niri,
  ...
}: {
  home.packages = with pkgs; [
    alacritty
    codex
    fuzzel
    fzf
    gcc
    git
    lazygit
    tmux
    noctalia-shell
    nodejs
    playerctl
    ripgrep
    tree
    vim
    vscode
    wget
    xcursor-themes
    zig
  ];
}
