-- Save on losing focus
vim.api.nvim_create_autocmd({
    "FocusLost"
}, {
    pattern = {
        "*"
    },
    command = [[wa]]
})

-- Delete trailing white spaces on close/save
-- \( ... Start a match group
-- $\n .. Match a new line (end-of-line character followed by a carriage return).
-- \) ... End the match group
-- \+ ... Allow any number of occurrences of this group (one or more).
-- \%$ .. Match the end of the file
vim.api.nvim_create_autocmd({
    "BufWritePre",
    "FileWritePre"
}, {
    pattern = {
        "*"
    },
    command = [[
        if &filetype != 'binary'
            %s/\s\+$//e | %s/\r$//e | %s#\($\n\)\+\%$##e
    ]]
})

-- ansible
vim.api.nvim_create_autocmd({
    "BufRead",
    "BufNewFile"
}, {
    pattern = {
        "*/ansible/*.yml"
    },
    callback = function()
        vim.bo.filetype = "yaml.ansible"
    end
})

-- ansible hosts
vim.api.nvim_create_autocmd({
    "BufRead",
    "BufNewFile"
}, {
    pattern = {
        "*/ansible/inventory/*",
        "*/ansible/hosts-*",
        "*/hosts-*.yml"
    },
    callback = function()
        local filepath = vim.fn.expand("%:p")
        if filepath:match("%.yml$") then
            vim.bo.filetype = "yaml.ansible_hosts"
        else
            vim.bo.filetype = "ansible_hosts"
        end
    end
})

-- strikeout test surrounded with ~~ foo ~~
vim.api.nvim_create_autocmd({
    "FileType"
}, {
    group = vim.api.nvim_create_augroup("StrikeoutMatch", {
        clear = true
    }),
    pattern = {
        "text"
    },
    callback = function()
        vim.fn.matchadd("StrikeoutMatch", "\\~\\~.*\\~\\~")
        vim.api.nvim_set_hl(0, "StrikeoutColor", {
            bg = "black",
            fg = "gray"
        })
        vim.api.nvim_set_hl(0, "StrikeoutMatch", {
            link = "StrikeoutColor"
        })
    end
})

-- :h last-position-jump
vim.api.nvim_create_autocmd({
    'BufReadPost'
}, {
    pattern = {
        '*'
    },
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if (ft:match('commit') or ft:match('rebase')) then return end
        -- get position of last saved edit
        local markpos = vim.api.nvim_buf_get_mark(0, '"')
        local line = markpos[1]
        local col = markpos[2]
        -- if in range, go there
        if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
            vim.api.nvim_win_set_cursor(0, {
                line,
                col
            })
        end
    end
})

-- par
if vim.fn.executable("par") then vim.opt.formatprg = "par -w80" end

-- inoreabbr idate <c-r>=substitute(system('date -u +"%FT%TZ"'),'[\r\n]*$','','')<cr><esc>
vim.cmd([[inoreabbrev idate <c-r>=strftime("%FT%TZ", localtime())<cr><esc>]])
