{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    clang-tools
    lua-language-server
    neovim
    nil
    ols
    stylua
    tinymist
    tree-sitter
    typst
    websocat
    zls
  ];
}
