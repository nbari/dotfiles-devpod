return {
    -- "github/copilot.vim",
    -- event = 'InsertEnter',
    -- init = function()
    --     vim.keymap.set('i', '<C-j>', "copilot#Next()", {
    --         expr = true,
    --         silent = true
    --     })
    --     vim.keymap.set('i', '<C-k>', "copilot#Previous()", {
    --         expr = true,
    --         silent = true
    --     })
    -- end

    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept_word = false,
                    accept_line = false,
                    accept = "<S-Tab>",
                    next = "<C-j>",
                    prev = "<C-k>",
                    dismiss = "<C-h>"
                }
            },
            filetypes = {
                ["*"] = true
            }
        })
    end
}
