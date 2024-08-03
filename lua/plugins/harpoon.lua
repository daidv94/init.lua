return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup()
    local harpoon = require("harpoon")

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window by telescope" })

    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>hj", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>hk", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>hl", function()
      harpoon:list():select(4)
    end)
  end,
}