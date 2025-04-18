return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<leader>fe", "<cmd>Neotree focus<CR>", desc = "Focus Neo-tree" },
  },
  opts = {
    window = {
      width = 32,
      mappings = {
        ["<space>"] = "none", -- Desativa o espaço para não conflitar com o líder
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true, -- Segue o arquivo atual automaticamente
      },
      use_libuv_file_watcher = true, -- Usa file watcher para atualização automática
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- Adiciona os ícones de expandir/colapsar
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup({
          filter_rules = {
            bo = { filetype = { "neo-tree", "neo-tree-popup", "notify" }, buftype = { "terminal", "quickfix" } },
          },
        })
      end,
    },
  },
}
