local local_path = vim.fn.expand("$HOME") .. "/projects/boda.nvim"

if vim.fn.isdirectory(local_path) == 1 then
  -- Если локальный проект существует, добавляем его в начало Runtime Path
  vim.opt.rtp:prepend(local_path)
else
  -- Если локальной папки нет, подгружаем плагин из стандартного места установки packadd
  pcall(vim.cmd, "packadd boda.nvim")
end

-- Настройка и применение темы
local ok, boda = pcall(require, "boda")
if ok then
  boda.setup({
    mirage = false,
    terminal = true,
	priority = 1000;
    overrides = {},
  })
  boda.colorscheme()
end
