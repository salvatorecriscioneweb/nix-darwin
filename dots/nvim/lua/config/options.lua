-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

if vim.g.neovide then
  -- Neovide options
  vim.g.neovide_window_blurred = true
  vim.g.neovide_transparency = 0.90
  vim.o.guifont = "iMWritingMono Nerd Font:h15"
  vim.g.neovide_refresh_rate_idle = 5
end
