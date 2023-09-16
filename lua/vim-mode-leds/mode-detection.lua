local active_file_types = ""

local group_id = vim.api.nvim_create_augroup("vim-mode-leds", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:n' },
  group = group_id,
  command = 'LedModeNormal'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:v' },
  group = group_id,
  command = 'LedModeVisual'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:s' },
  group = group_id,
  command = 'LedModeSelect'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:i' },
  group = group_id,
  command = 'LedModeInsert'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:c' },
  group = group_id,
  command = 'LedModeCmd'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:cv' },
  group = group_id,
  command = 'LedModeEx'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:t' },
  group = group_id,
  command = 'LedModeTerminal'
})

