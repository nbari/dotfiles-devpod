return {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = ""
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "ansiblels",
                "bashls",
                "html",
                "jsonls",
                "rust_analyzer"
            }
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "ansible-language-server",
                "autopep8",
                "bash-language-server",
                "beautysh",
                "black",
                "codespell",
                "eslint_d",
                "eslint-lsp",
                "html-lsp",
                "isort",
                "jq",
                "luaformatter",
                "marksman",
                "prettier",
                "python-lsp-server",
                "rust-analyzer",
                "shellcheck",
                "shellharden",
                "shfmt",
                "sqlfmt",
                "terraform-ls",
                "yamlfix",
                "yamllint"
            },
            auto_update = true
        })
    end
}
