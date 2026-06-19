local preview_job = nil

local function project_root()
    local file = vim.api.nvim_buf_get_name(0)
    local markers = vim.fs.find({ "typst.toml", ".git" }, {
        path = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd(),
        upward = true,
    })

    if markers[1] then
        return vim.fs.dirname(markers[1])
    end

    return vim.fn.getcwd()
end

local function stop_preview()
    if preview_job then
        vim.fn.jobstop(preview_job)
        preview_job = nil
        vim.notify("Typst preview stopped", vim.log.levels.INFO)
    end
end

local function start_preview()
    local file = vim.api.nvim_buf_get_name(0)
    if file == "" then
        vim.notify("Save the Typst file before starting preview", vim.log.levels.WARN)
        return
    end

    stop_preview()

    local root = project_root()
    preview_job = vim.fn.jobstart({
        "tinymist",
        "preview",
        "--open",
        "--root",
        root,
        file,
    }, {
        cwd = root,
        stdout_buffered = false,
        stderr_buffered = false,
        on_exit = function(_, code)
            preview_job = nil
            if code ~= 0 and code ~= 143 then
                vim.schedule(function()
                    vim.notify("Typst preview exited with code " .. code, vim.log.levels.ERROR)
                end)
            end
        end,
    })

    if preview_job <= 0 then
        preview_job = nil
        vim.notify("Failed to start Typst preview", vim.log.levels.ERROR)
        return
    end

    vim.notify("Typst preview started", vim.log.levels.INFO)
end

vim.api.nvim_buf_create_user_command(0, "TypstPreview", start_preview, {
    desc = "Start Tinymist live preview",
})

vim.api.nvim_buf_create_user_command(0, "TypstPreviewStop", stop_preview, {
    desc = "Stop Tinymist live preview",
})

vim.keymap.set("n", "<leader>tp", start_preview, {
    buffer = true,
    desc = "Typst preview",
})

vim.keymap.set("n", "<leader>tP", stop_preview, {
    buffer = true,
    desc = "Stop Typst preview",
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    buffer = 0,
    callback = stop_preview,
})
