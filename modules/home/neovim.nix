{pkgs, ...}: let
  neovim = pkgs.neovim.override {
    configure = {
      customRC = ''
        lua dofile(vim.fn.stdpath("config") .. "/init.lua")
      '';

      packages.myPlugins.start = with pkgs.vimPlugins; [
        cmp-buffer
        cmp-nvim-lsp
        cmp-path
        gruvbox-nvim
        harpoon2
        nvim-cmp
        nvim-lspconfig
        (nvim-treesitter.withPlugins (parsers:
          with parsers; [
            c
            cpp
            lua
            query
            typst
            zig
          ]))
        oil-nvim
        plenary-nvim
        telescope-nvim
        undotree
      ];
    };
  };
in {
  home.packages = with pkgs; [
    clang-tools
    neovim
    tinymist
    typst
    zls
  ];
}
