-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt
vim.g.lazyvim_picker = "telescope"

vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.o.spelllang = "ru_ru,en_us"

opt.scrolloff = 30
opt.relativenumber = true

vim.g.snacks_animate = false

-- postcss support
vim.filetype.add({
  extension = {
    pcss = "css",
  },
})
