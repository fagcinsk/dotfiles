local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_length = 2,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' },
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ["<PageUp>"] = function(_)
            for _ = 1, 8 do
                cmp.mapping.select_prev_item()(nil)
            end
        end,
        ["<PageDown>"] = function(_)
            for _ = 1, 8 do
                cmp.mapping.select_next_item()(nil)
            end
        end,
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            menu = ({
                buffer = '[B]',
                nvim_lsp = '[L]',
                luasnip = '[S]',
                calc = '[C]',
                path = '[P]',
                neorg = '[N]',
                emoji = '[E]',
                cmp_tabnine = '[T]',
            }),
        }),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})
