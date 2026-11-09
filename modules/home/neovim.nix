{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    lua-language-server
    neovim
    nil
    stylua
    tree-sitter
    zig
    zls
  ];
}
