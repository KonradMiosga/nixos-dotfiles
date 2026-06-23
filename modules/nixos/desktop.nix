{pkgs, ...}: {
  services.displayManager.ly.enable = true;

  programs.firefox.enable = true;
  programs.niri.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    newcomputermodern
  ];
}
