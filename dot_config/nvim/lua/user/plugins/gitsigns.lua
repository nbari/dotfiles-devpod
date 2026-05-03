return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "folke/which-key.nvim"
    },
    cond = function()
        function string.starts(str, start)
            return start == string.sub(str, 1, string.len(start))
        end

        local result = vim.fn.system("git rev-parse --is-inside-work-tree")
        return string.starts(result, "true")
    end,
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({})

        -- Gitsigns key mapping
        local wk = require("which-key")
        wk.add({
            {
                "<leader>g",
                group = "Git"
            },
            {
                "<leader>gR",
                gitsigns.reset_buffer,
                desc = "Reset buffer"
            },
            {
                "<leader>gd",
                "<cmd>Gitsigns diffthis HEAD<CR>",
                desc = "Show diff to HEAD"
            },
            {
                "<leader>gj",
                gitsigns.next_hunk,
                desc = "Next hunk"
            },
            {
                "<leader>gk",
                gitsigns.prev_hunk,
                desc = "Previous hunk"
            },
            {
                "<leader>gl",
                gitsigns.blame_line,
                desc = "Blame line"
            },
            {
                "<leader>gp",
                gitsigns.preview_hunk,
                desc = "Preview hunk"
            },
            {
                "<leader>gr",
                gitsigns.reset_hunk,
                desc = "Reset hunk"
            },
            {
                "<leader>gs",
                gitsigns.stage_hunk,
                desc = "Stage hunk"
            },
            {
                "<leader>gu",
                gitsigns.undo_stage_hunk,
                desc = "Unstage hunk"
            }
        })
    end
}
