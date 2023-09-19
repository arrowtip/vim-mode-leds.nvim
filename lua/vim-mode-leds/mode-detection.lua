local group_id = vim.api.nvim_create_augroup("vim-mode-leds", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:n' },
  group = group_id,
  command = 'LedMode 1'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:v' },
  group = group_id,
  command = 'LedMode 2'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:s' },
  group = group_id,
  command = 'LedMode 3'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:i' },
  group = group_id,
  command = 'LedMode 4'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:c' },
  group = group_id,
  command = 'LedMode 5'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:cv' },
  group = group_id,
  command = 'LedMode 5'
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:t' },
  group = group_id,
  command = 'LedMode 6'
})

vim.api.nvim_create_autocmd("FocusLost", {
  pattern = { '*' },
  group = group_id,
  command = 'LedMode 0'
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = { '*' },
  group = group_id,
  command = 'LedMode 0'
})

vim.api.nvim_create_autocmd("VimSuspend", {
  pattern = { '*' },
  group = group_id,
  command = 'LedMode 0'
})

vim.api.nvim_create_autocmd("FocusGained", {
  pattern = { '*' },
  group = group_id,
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    print("well we fucked up: " .. mode)
  end
})
