{...}: {
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#scrappy";
      vim = "nvim";
      lg = "lazygit";
      ll = "ls -la";
    };
    initExtra = ''
      export MANPAGER='nvim +Man!'

      PS1=$'\[\033[0;34m\]\u@\h\[\033[0m\] \[\033[0;32m\]\w\[\033[0m\] \[\033[0;35m\]\$\[\033[0m\] '

      if [ -x "$HOME/.local/bin/tmux-sessionizer" ]; then
        bind -x '"\C-f": "$HOME/.local/bin/tmux-sessionizer"'
      fi
    '';
  };
}
