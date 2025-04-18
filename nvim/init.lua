-- Defina o líder antes de carregar qualquer plugin
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Configurações básicas para melhor performance
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Melhorias na UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Inicialize o Lazy.nvim
require("config.lazy")

-- Carregar configurações
require("config.options")
require("config.autocmds")
require("config.keymaps")
