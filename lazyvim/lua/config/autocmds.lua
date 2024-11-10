-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Файл: ~/.config/nvim/lua/config/autocommands.lua

-- Автокоманда для файлов C и C++
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "cpp"},  -- Применять для файлов C и C++
  callback = function()
    vim.opt_local.tabstop = 4      -- Устанавливаем tabstop = 4
    vim.opt_local.shiftwidth = 4   -- Устанавливаем shiftwidth = 4
    vim.opt_local.expandtab = false -- Преобразуем табуляции в пробелы
  end,
})