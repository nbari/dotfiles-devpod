local M = {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons"
    }
}

M.keys = {
    {
        ".",
        function()
            require("oil").open_float()
        end,
        desc = "open parent directory"
    }
}

M.config = function()
    require("oil").setup()
end

return M
