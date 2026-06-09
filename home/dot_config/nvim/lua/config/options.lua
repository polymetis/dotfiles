-- Options are automatically loaded before lazy.nvim startup.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Indentation: 2 spaces (matches the VS Code setup).
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Show whitespace. VS Code used renderWhitespace = "all"; in nvim a dot for
-- *every* space is noisy, so this shows tabs, trailing space and nbsp. To match
-- "all" exactly, add  space = "·"  to the listchars table below.
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣", extends = "❯", precedes = "❮" }
