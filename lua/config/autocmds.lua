-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
---@diagnostic disable: param-type-mismatch

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Grupo para configurações do Neo-tree
local neotree_group = augroup("NeoTreeConfig", { clear = true })

-- Fecha Neo-tree automaticamente ao abrir um arquivo
autocmd("BufEnter", {
  desc = "Close Neo-tree automatically when opening a file",
  group = neotree_group,
  callback = function(ev)
    if vim.bo[ev.buf].filetype == "neo-tree" then
      return
    end

    -- Verifica se há outras janelas abertas além do Neo-tree
    local wins = vim.api.nvim_list_wins()
    if #wins > 1 then
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
          -- Mantém o Neo-tree aberto se estiver em modo focus
          local win_config = vim.api.nvim_win_get_config(win)
          if not win_config.relative then
            return
          end
        end
      end
    end
  end,
})

-- Restaura o cursor na última posição conhecida ao abrir um arquivo
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
  end,
})

-- Configurações de filetype
local au_filetypes = augroup("ConfigFileType", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, { group = au_filetypes, pattern = { "*" }, command = "set fo-=o" })
autocmd(
  { "BufRead", "BufNewFile" },
  { group = au_filetypes, pattern = { "*.conf", "*.ini" }, command = "setl filetype=dosini" }
)
autocmd({ "BufRead", "BufNewFile" }, { group = au_filetypes, pattern = { "*.zsh" }, command = "setl filetype=sh" })

-- Comandos ao salvar arquivos
local au_on_save = augroup("ConfigOnSave", { clear = true })
autocmd(
  { "BufWritePost" },
  { group = au_on_save, pattern = { "*bspwrc" }, command = "!./%; notify-send -i reload 'Running bspwmrc'" }
)
autocmd(
  { "BufWritePost" },
  { group = au_on_save, pattern = { "*dunstrc" }, command = "!killall dunst; notify-send -i reload 'Restarting dunst'" }
)
autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*sxhkdrc" },
  command = "!pkill -USR1 sxhkd; notify-send -i reload 'Reloading sxhkd'",
})
autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*polybar/config.ini" },
  command = "!polybar-msg cmd restart; notify-send -i reload 'Restarting polybar'",
})
autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*waybar/config" },
  command = "!killall -SIGUSR2 waybar; notify-send -i reload 'Reloading waybar'",
})
autocmd({ "BufWritePost" }, {
  group = au_on_save,
  pattern = { "*Xresources", "*Xdefaults" },
  command = "!xrdb %; notify-send -i reload 'Setting xrdb'",
})

-- Ajuste proporcional de janelas ao redimensionar terminal
local au_resize_propor = augroup("ResizePropor", { clear = true })
autocmd({ "VimResized" }, {
  group = au_resize_propor,
  command = "tabdo wincmd =",
})
