return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            compile = true, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = {
                italic = false
            },
            functionStyle = {},
            keywordStyle = {
                italic = false
            },
            statementStyle = {
                bold = true
            },
            typeStyle = {},
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = { -- add/modify theme and palette colors
                palette = {
                    fujiWhite = "#c5c5c5"
                },
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                return {
                    NormalFloat = {
                        bg = "none"
                    },
                    FloatBorder = {
                        bg = "none"
                    },
                    FloatTitle = {
                        bg = "none"
                    },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    NormalDark = {
                        fg = theme.ui.fg_dim,
                        bg = theme.ui.bg_m3
                    },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    LazyNormal = {
                        bg = theme.ui.bg_m3,
                        fg = theme.ui.fg_dim
                    },
                    MasonNormal = {
                        bg = theme.ui.bg_m3,
                        fg = theme.ui.fg_dim
                    },
                    -- yaml
                    ["@field.yaml"] = {
                        fg = theme.syn.special3
                    },
                    ["@string.yaml"] = {
                        fg = theme.ui.fg
                    },
                    ["@number.yaml"] = {
                        fg = theme.syn.special1
                    },
                    -- yaml.ansible
                    ["@lsp.type.property.yaml.ansible_hosts"] = {
                        fg = theme.syn.special3
                    },
                    ["@lsp.type.class.yaml.ansible"] = {
                        fg = theme.syn.identifier
                    },
                    ["@lsp.type.keyword.yaml.ansible"] = {
                        fg = theme.syn.special3
                    },
                    ["@lsp.type.property.yaml.ansible"] = {
                        fg = theme.syn.fun
                    },
                    -- ansible
                    ["@lsp.type.class.ansible"] = {
                        fg = theme.syn.identifier
                    },
                    ["@lsp.type.keyword.ansible"] = {
                        fg = theme.syn.special3
                    },
                    ["@lsp.type.property.ansible"] = {
                        fg = theme.syn.fun
                    },
                    jinjaFilter = {
                        fg = theme.syn.special1
                    },
                    jinjaVarDelim = {
                        fg = theme.syn.statement
                    },
                    jinjaVarBlock = {
                        fg = theme.syn.constant
                    },
                    jinjaVariable = {
                        fg = theme.syn.constant
                    },
                    yamlFlowString = {
                        fg = theme.syn.string
                    },
                    yamlInteger = {
                        fg = theme.syn.number
                    },
                    yamlBool = {
                        fg = theme.syn.constant
                    },
                    ansible_attributes = {
                        fg = theme.syn.comment
                    }
                }
            end,
            theme = "wave", -- Load "wave" theme when 'background' option is not set
            background = { -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus"
            }
        })

    end
}
