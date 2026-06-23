{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
    wireplumber
    man-pages
    man-pages-posix
  ];
}
