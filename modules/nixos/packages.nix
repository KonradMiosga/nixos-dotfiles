{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    git
    playerctl
    tree
    vim
    wget
    wireplumber
  ];
}
