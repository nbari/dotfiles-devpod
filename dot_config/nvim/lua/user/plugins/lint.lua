--
-- You can check the filetype of a file by running this command:
-- :lua print(vim.bo.filetype)
--
local M = {
    "mfussenegger/nvim-lint",
    event = "VeryLazy"
}

M.config = function()
    require("lint").linters_by_ft = {
        yaml = {
            'yamllint'
        }
    }

end

vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWritePost",
    "InsertLeave"
}, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then lint.try_lint() end
    end
})

vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWritePost",
    "InsertLeave"
}, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
            lint.try_lint({
                "codespell"
            })
        end
    end
})

return M
