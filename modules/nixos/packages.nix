{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    graphviz
    lm_sensors
    man-pages
    man-pages-posix
    plantuml
    wireplumber
  ];
  # Use emacs overlay. Required for Emacs 28+.
  # Use a commit SHA for a specific commit to prevent overlay rebuild every time (can be very long).
  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/87181272bf633bbc9f19a8aa8662833940bf18ed.tar.gz";
      }
    ))
  ];
}
