{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    lua-language-server
    neovim
    nil
    stylua
    taplo
    tree-sitter
    zig
    zls
  ];
}
