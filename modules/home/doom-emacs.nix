{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  home.packages = with pkgs; [
    cmake
    direnv
    fd
    git
    gcc
    gnutls
    imagemagick
    libtool
    nil
    nodejs
    ripgrep
    sqlite
    tree-sitter
  ];

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
  ];

  xdg.configFile = {
    "doom/init.el".source = ../../config/doom/init.el;
    "doom/config.el".source = ../../config/doom/config.el;
    "doom/packages.el".source = ../../config/doom/packages.el;
  };
}
