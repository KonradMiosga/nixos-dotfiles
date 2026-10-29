{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    google-chrome
    lm_sensors
    man-pages
    man-pages-posix
    wireplumber
  ];
}
