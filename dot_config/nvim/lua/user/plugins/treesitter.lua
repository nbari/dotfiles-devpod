---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    config = function()
        local treesitter = require("nvim-treesitter")
        local parsers = {
            "bash",
            "c",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "rust",
            "toml",
            "vim",
            "vimdoc",
            "yaml"
        }
        local site_dir = vim.fn.stdpath("data") .. "/site"
        local parser_install_dir = site_dir .. "/parser"

        -- use bash for zsh
        vim.treesitter.language.register("bash", "zsh")

        if treesitter.install then
            vim.fn.mkdir(site_dir, "p")
            treesitter.setup({
                install_dir = site_dir
            })

            -- Install parsers using the new API
            for _, parser in ipairs(parsers) do
                pcall(treesitter.install, parser)
            end

            local group = vim.api.nvim_create_augroup("UserTreesitter", {
                clear = true
            })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = "*",
                callback = function(args)
                    if vim.bo[args.buf].buftype ~= "" then return end
                    if vim.bo[args.buf].filetype == "yaml" then return end

                    pcall(vim.treesitter.start, args.buf)

                    local indent_filetypes = {
                        bash = true,
                        c = true,
                        lua = true,
                        python = true,
                        rust = true,
                        toml = true,
                        vim = true,
                        zsh = true
                    }
                    if indent_filetypes[vim.bo[args.buf].filetype] then
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end
            })

            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            return
        end

        vim.fn.mkdir(parser_install_dir, "p")
        vim.opt.runtimepath:prepend(parser_install_dir)
        treesitter.setup({
            parser_install_dir = parser_install_dir,
            ensure_installed = parsers,
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = {
                    "yaml"
                },
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            }
        })

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
}
