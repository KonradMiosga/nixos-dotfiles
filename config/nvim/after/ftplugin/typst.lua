vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreview<cr>", {
    buffer = true,
    desc = "Typst preview",
})

vim.keymap.set("n", "<leader>tP", "<cmd>TypstPreviewStop<cr>", {
    buffer = true,
    desc = "Stop Typst preview",
})

vim.keymap.set("n", "<leader>tt", "<cmd>TypstPreviewToggle<cr>", {
    buffer = true,
    desc = "Toggle Typst preview",
})

vim.keymap.set("n", "<leader>ts", "<cmd>TypstPreviewSyncCursor<cr>", {
    buffer = true,
    desc = "Sync Typst preview",
})
