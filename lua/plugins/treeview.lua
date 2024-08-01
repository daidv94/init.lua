return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      git = {
        ignore = false,
      },
      filters = {
        dotfiles = false,
      },
      view = {
        adaptive_size = true,
      },
    }
    vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>er', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ec', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
  end,
}
