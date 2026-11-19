return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				toml = { "taplo" },
				zig = { "zigfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true })
		end, { desc = "Format buffer" })
	end,
}
