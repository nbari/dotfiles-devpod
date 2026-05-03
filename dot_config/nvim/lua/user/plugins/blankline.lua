return {
    'lukas-reineke/indent-blankline.nvim',
    priority = 500,
    main = "ibl",
    opts = {
        debounce = 100,
        indent = {
            char = '┊'
        },
        whitespace = {
            highlight = {
                "Whitespace",
                "NonText"
            }
        },
        scope = {
            enabled = false
        }
    }
}
