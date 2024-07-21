-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local format = augroup("Format", {})

local yank = augroup("HighLightYank", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = yank,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = format,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

