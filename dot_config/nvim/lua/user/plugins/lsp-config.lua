return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                            'core'
                        }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        maxPreload = 1000,
                        preloadFileSize = 1000
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        })

        vim.lsp.config('ansiblels', {
            filetypes = {
                'ansible',
                'yaml.ansible',
                'yaml.ansible_hosts'
            },
            settings = {
                ansible = {
                    validation = {
                        lint = {
                            arguments = '-c ~/.config/ansible-lint.yml -x command-instead-of-shell'
                        }
                    }
                }
            }
        })

    end
}
