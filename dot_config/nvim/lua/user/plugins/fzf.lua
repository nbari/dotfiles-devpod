local M = {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}

M.keys = {
    {
        "<C-p>",
        function()
            require("fzf-lua").files()
        end,
        desc = "fzf-lua files"
    },
    {
        "<leader>g",
        function()
            require("fzf-lua").git_files()
        end,
        desc = "fzf-lua git files"
    },
    {
        "<C-f>",
        function()
            require("fzf-lua").grep()
        end,
        desc = "fzf-lua grep"
    },
    {
        "<C-o>",
        function()
            require("fzf-lua").oldfiles()
        end,
        desc = "fzf-lua oldfiles"
    },
    {
        "<C-s>",
        function()
            require("fzf-lua").live_grep()
        end,
        desc = "fzf-lua live grep"
    }
}

return M
