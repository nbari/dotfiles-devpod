local M = {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/nvim-cmp",
        "hrsh7th/vim-vsnip"
    }
}

M.config = function()
    local cmp = require("cmp")
    cmp.setup({
        -- Enable LSP snippets
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            })
        },
        -- LuaFormatter off
        sources = {
            { name = "path" }, -- file paths
            { name = "nvim_lsp", keyword_length = 3 }, -- from language server
            { name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
            { name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
            { name = "buffer", keyword_length = 2 }, -- source current buffer
            { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
            { name = "calc" } -- source for math calculation
        },
        -- LuaFormatter on
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {
                "menu",
                "abbr",
                "kind"
            },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = "λ",
                    vsnip = "⋗",
                    buffer = "Ω",
                    path = "🖫"
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end
        }
    })
end

return M
