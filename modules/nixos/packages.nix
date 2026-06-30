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

  # Provides newer Emacs builds/packages for a manually installed Doom Emacs.
  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/87181272bf633bbc9f19a8aa8662833940bf18ed.tar.gz";
      }
    ))
  ];
}
