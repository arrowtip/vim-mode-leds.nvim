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

vim.api.nvim_create_autocmd({"FocusLost", "VimLeave", "VimSuspend"}, {
  pattern = { '*' },
  group = group_id,
  command = 'LedMode 0'
})

vim.api.nvim_create_autocmd("FocusGained", {
  pattern = { '*' },
  group = group_id,
  callback = function(args)
    print("stored mode is: "..vim.api.nvim_win_get_var(0, 'LedMode'))
    vim.cmd("LedMode "..vim.api.nvim_win_get_var(0, 'LedMode'))
  end
})
