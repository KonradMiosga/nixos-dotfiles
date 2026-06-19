require("typst-preview").setup({
    dependencies_bin = {
        tinymist = "tinymist",
        websocat = "websocat",
    },
    invert_colors = "auto",
    get_root = function(path_of_main_file)
        local main_dir = vim.fs.dirname(vim.fn.fnamemodify(path_of_main_file, ":p"))
        local marker = vim.fs.find({ "typst.toml", ".git" }, {
            path = main_dir,
            upward = true,
        })[1]

        if marker then
            return vim.fs.dirname(marker)
        end

        return main_dir
    end,
})
