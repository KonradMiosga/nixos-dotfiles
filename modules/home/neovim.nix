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
        lualine-nvim
        nvim-cmp
        nvim-highlight-colors
        nvim-lspconfig
        (nvim-treesitter.withPlugins (parsers:
          with parsers; [
            c
            cpp
            lua
            nix
            query
            typst
            zig
          ]))
        mini-nvim
        oil-nvim
        plenary-nvim
        telescope-nvim
        typst-preview-nvim
        undotree
      ];
    };
  };
in {
  home.packages = with pkgs; [
    alejandra
    clang-tools
    lua-language-server
    neovim
    nil
    tinymist
    typst
    websocat
    zls
  ];
}
