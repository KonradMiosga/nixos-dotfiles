{config, ...}: let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  mkConfigLink = path: config.lib.file.mkOutOfStoreSymlink path;

  configDirs = {
    alacritty = "alacritty";
    niri = "niri";
    noctalia = "noctalia";
    nvim = "nvim";
  };
in {
  xdg.configFile =
    builtins.mapAttrs
    (_name: subpath: {
      source = mkConfigLink "${dotfiles}/${subpath}";
    })
    configDirs;
}
