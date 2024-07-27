return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup {
      toggler = {
        line = '<leader>c',
        block = '<leadre>b'
      },
      opleader = {
        line = '<leader>c',
        block = '<leader>b'
      }
    }
  end,
}
