{ ... }: {
  home.username = "copperplate";
  home.homeDirectory = "/home/copperplate";
  home.stateVersion = "26.05";
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
  };
}
