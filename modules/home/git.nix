{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Konrad Miosga";
        email = "konrad.miosga@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
