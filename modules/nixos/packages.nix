{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    graphviz
    lm_sensors
    man-pages
    man-pages-posix
    plantuml
    wireplumber
  ];
}
