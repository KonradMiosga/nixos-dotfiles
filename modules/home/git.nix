{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      core.editor = "nvim";
      user = {
        name = "Konrad Miosga";
        email = "konrad.miosga@gmail.com";
      };
      init.defaultBranch = "master";
    };
  };
}
