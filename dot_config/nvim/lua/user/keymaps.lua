--- Keymaps
vim.keymap.set("n", "<space>", "za")
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<Leader>x", ":set cursorline! cursorcolumn!<CR>")
vim.keymap.set("n", "<leader>qq", ":qa!<CR>")
vim.keymap.set("n", "<leader>s", ":setlocal spell!<CR>")
vim.keymap.set("n", "<leader>,", ":buffers<CR>")
vim.keymap.set("n", "<leader>h", ":history<CR>")

-- navigator
-- LuaFormatter off
vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- tmux compatible splits
-- vim.keymap.set({'n'}, '<C-w>', '<C-w>s')
-- vim.keymap.set({'n'}, '<C-w>%', '<C-w>v')
-- vim.keymap.set({'n'}, '<C-w>!', ' <C-w>T')

-- moving around in command mode
vim.keymap.set({ "c" }, "<c-h>", "<left>")
vim.keymap.set({ "c" }, "<c-j>", "<down>")
vim.keymap.set({ "c" }, "<c-k>", "<up>")
vim.keymap.set({ "c" }, "<c-l>", "<right>")

-- LuaFormatter on

-- comment
vim.keymap.set({
    "n"
}, "<leader>0", [[:execute 'normal! i# ' .. repeat('-',76)<CR>]])
