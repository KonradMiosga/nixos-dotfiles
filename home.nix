{...}: {
  imports = [
    ./modules/home/core.nix
    ./modules/home/cursor.nix
    ./modules/home/neovim.nix
    ./modules/home/packages.nix
    ./modules/home/shell.nix
    ./modules/home/ssh.nix
    ./modules/home/xdg-config.nix
  ];
}
