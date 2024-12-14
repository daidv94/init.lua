return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!.git/*",
        },
      },
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>sg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>sw", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>sW", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>sl", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>sm", builtin.marks, {})
    vim.keymap.set("n", "<leader>sp", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>sq", builtin.quickfix, {})

    -- Custom live grep, can be passed arguments into it
    require("config.telescope.multigrep").setup()
  end,
}
