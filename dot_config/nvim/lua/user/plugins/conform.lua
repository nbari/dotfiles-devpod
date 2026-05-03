local M = {
    "stevearc/conform.nvim",
    event = "VeryLazy"
}

M.keys = {
    {
        "<leader>ff",
        function()
            require("conform").format({
                lsp_fallback = true
            })
        end
    }
}

M.config = function()
    require("conform.formatters.yamlfix").env = {
        YAMLFIX_SEQUENCE_STYLE = "block_style",
        YAMLFIX_WHITELINES = 1
    }
    require("conform.formatters.jq").args = {
        "--indent",
        "2"
    }
    require("conform").setup({
        log_level = vim.log.levels.ERROR,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true
        },
        formatters_by_ft = {
            lua = {
                "lua"
            },
            json = {
                "jq"
            },
            sh = {
                "shfmt",
                "shellharden"
            },
            python = {
                "isort",
                "black"
            },
            yaml = {
                "yamlfix"
            },
            javascript = {
                "prettier"
            },
            vue = {
                "prettier"
            },
            javascriptreact = {
                "prettier",
                "eslint_d"
            }
        },
        formatters = {
            lua = {
                command = "lua-format",
                args = {
                    "--align-table-field",
                    "--break-after-table-lb",
                    "--chop-down-table",
                    "--column-table-limit=1",
                    "--no-keep-simple-function-one-line",
                    "--no-keep-simple-function-one-line",
                    "--spaces-inside-table-braces"
                }
            },
            yamlfix = {
                command = "yamlfix",
                args = {
                    "-"
                },
                env = {
                    YAMLFIX_SEQUENCE_STYLE = "block_style",
                    YAMLFIX_WHITELINES = 1
                }
            }
        }
    })
end

return M
