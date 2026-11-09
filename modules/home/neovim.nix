{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    neovim
    nil
    stylua
    tree-sitter
  ];
}
