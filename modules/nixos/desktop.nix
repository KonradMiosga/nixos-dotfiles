{ pkgs, ... }: {
  services.displayManager.ly.enable = true;

  programs.firefox.enable = true;
  programs.niri.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.extraConfig."10-disable-bluetooth-autoswitch" = {
      "wireplumber.settings" = {
        "bluetooth.autoswitch-to-headset-profile" = false;
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.blex-mono
    newcomputermodern
    ibm-plex
    noto-fonts
    noto-fonts-color-emoji
    symbola
  ];
}
