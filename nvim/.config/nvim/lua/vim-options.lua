-- Tabbing
vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.opt.swapfile = false

-- Assign leader key
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Save file with Ctrl+S in normal and insert modes
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Quit Neovim with Ctrl+Q in normal mode
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", opts)

-- Copy to clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.keymap.set("n", "<leader>th", function()
  require("themery").ui()
end, { desc = "Toggle themery" })
