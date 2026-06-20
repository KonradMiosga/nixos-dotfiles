local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = "menu,menuone,noinsert",
        autocomplete = { cmp.TriggerEvent.TextChanged },
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    -- mapping = cmp.mapping.preset.insert({
    --     ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --     ["<C-e>"] = cmp.mapping.abort(),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --     ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    --     ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --     ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_next_item()
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }),
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }),
    -- }),
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer",  keyword_length = 3 },
    },
})
