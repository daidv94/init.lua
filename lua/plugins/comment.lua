-- Refer https://github.com/numToStr/Comment.nvim to get the key mapping
-- Or use :help comment in neovim
return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({})
  end,
}
