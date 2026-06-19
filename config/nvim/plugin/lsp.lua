vim.lsp.config("*", {
    root_markers = { ".git" },
})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
        },
    },
})

local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 24
    opts.wrap = opts.wrap ~= false
    return orig(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local buf = args.buf
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "LSP hover")
        map("n", "gd", vim.lsp.buf.definition, "LSP definition")
        map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
        map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
        map("n", "go", vim.lsp.buf.type_definition, "LSP type definition")
        map("n", "gr", vim.lsp.buf.references, "LSP references")
        map("n", "gs", vim.lsp.buf.signature_help, "LSP signature")
        map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "<F2>", vim.lsp.buf.rename, "LSP rename")
        map({ "n", "x" }, "<F3>", function()
            vim.lsp.buf.format({ async = true })
        end, "LSP format")
        map("n", "<F4>", vim.lsp.buf.code_action, "LSP code action")

        if client:supports_method("textDocument/documentHighlight") then
            local group = vim.api.nvim_create_augroup("my.lsp.highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = buf,
                group = group,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = buf,
                group = group,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("my.lsp.format", {}),
    pattern = "*.nix",
    callback = function(args)
        vim.lsp.buf.format({
            bufnr = args.buf,
            timeout_ms = 2000,
            filter = function(client)
                return client.name == "nil_ls"
            end,
        })
    end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "compile_commands.json", ".clangd", "Makefile", ".git" },
    capabilities = capabilities,
}

vim.lsp.config.tinymist = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { "typst.toml", ".git" },
    capabilities = capabilities,
}

vim.lsp.config.zls = {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig", ".git" },
    capabilities = capabilities,
    settings = {
        zls = {
            enable_build_on_save = true,
            build_on_save_step = "install",
            warn_style = false,
            enable_snippets = true,
        },
    },
}

vim.lsp.config.nil_ls = {
    cmd = { "nil" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "default.nix", ".git" },
    capabilities = capabilities,
    settings = {
        ["nil"] = {
            formatting = {
                command = { "alejandra" },
            },
        },
    },
}

vim.filetype.add({
    extension = {
        h = "c",
        typ = "typst",
    },
})

vim.lsp.enable({
    "clangd",
    "lua_ls",
    "nil_ls",
    "tinymist",
    "zls",
})
