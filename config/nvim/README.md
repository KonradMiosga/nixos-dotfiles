# Neovim

This config keeps Neovim Lua settings in `config/nvim`, while Nix installs
Neovim, plugins, Tree-sitter parsers, and language servers.

## Plugins

- Gruvbox
- Telescope
- Harpoon2
- Oil
- nvim-lspconfig
- nvim-treesitter
- Undotree

## Language Servers

- C/C++: `clangd`
- Typst: `tinymist`
- Zig: `zls`

## Keybinds

| Mode | Key | Action |
| --- | --- | --- |
| `n` | `<leader>cd` | Open Oil |
| `n` | `<leader>ff` | Telescope find files |
| `n` | `<leader>fg` | Telescope grep prompt |
| `n` | `<leader>fb` | Telescope buffers |
| `n` | `<leader>a` | Add file to Harpoon |
| `n` | `<C-e>` | Open Harpoon quick menu |
| `n` | `<C-p>` | Previous Harpoon item |
| `n` | `<C-n>` | Next Harpoon item |
| `n` | `<leader>u` | Toggle Undotree |
| `n` | `K` | LSP hover |
| `n` | `gd` | LSP definition |
| `n` | `<F2>` | LSP rename |
| `n`, `x` | `<F3>` | LSP format |
| `n` | `<F4>` | LSP code action |
