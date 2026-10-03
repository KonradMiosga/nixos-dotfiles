{ ... }: {
  home.file.".local/bin/tmux-sessionizer" = {
    source = ../../scripts/tmux-sessionizer;
    executable = true;
  };
}
