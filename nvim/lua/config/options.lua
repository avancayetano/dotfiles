-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.conceallevel = 0
opt.showtabline = 2
opt.synmaxcol = 400
-- NOTE: To use powershell, uncomment:
-- WARNING: Some other plugin might be assuming cmd instead of pwsh
-- TODO: Fix issue when running :!command (color codes are displayed)
-- opt.shell = "pwsh.exe"
-- opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
-- opt.shellxquote = ""
-- opt.shellquote = ""
-- opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
-- opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"
