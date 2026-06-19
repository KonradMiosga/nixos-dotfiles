{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    options = {
      selection-clipboard = "clipboard";
      # recolor = true;
      # recolor-lightcolor = "#282828";
      # recolor-darkcolor = "#ebdbb2";
      # default-bg = "#282828";
      # default-fg = "#ebdbb2";
      # statusbar-bg = "#282828";
      # statusbar-fg = "#ebdbb2";
      # inputbar-bg = "#282828";
      # inputbar-fg = "#ebdbb2";
    };
  };
}
