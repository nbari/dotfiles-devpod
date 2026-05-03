-- check with set <var>?
vim.g.mapleader = ","
vim.opt.guicursor = "n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.ffs = "unix"
vim.opt.shiftround = true
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.listchars = {
    eol = "↴",
    space = "␣",
    trail = "•",
    extends = "⟩",
    precedes = "⟨",
    tab = ":▸",
    nbsp = "."
}

vim.opt.termguicolors = true

local pyenv_nvim_python = vim.fn.expand("$HOME/.pyenv/versions/nvim-env/bin/python")
if vim.fn.executable(pyenv_nvim_python) == 1 then
    vim.g.python3_host_prog = pyenv_nvim_python
elseif vim.fn.executable("/usr/bin/python3") == 1 then
    vim.g.python3_host_prog = "/usr/bin/python3"
end
