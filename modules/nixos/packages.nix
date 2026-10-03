{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    google-chrome
    graphviz
    lm_sensors
    man-pages
    man-pages-posix
    plantuml
    wireplumber
  ];
}
