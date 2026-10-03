{ osConfig, ... }: {
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#${osConfig.networking.hostName}";
      vim = "nvim";
      lg = "lazygit";
      ll = "ls -la";
      ndev = "nix develop";
    };
    initExtra = ''
      if [ -x "$HOME/.local/bin/tmux-sessionizer" ]; then
        bind -x '"\C-f": "$HOME/.local/bin/tmux-sessionizer"'
      fi

      eval "$(starship init bash)"
    '';
  };
}
