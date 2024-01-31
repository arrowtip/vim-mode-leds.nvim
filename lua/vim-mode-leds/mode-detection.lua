local group_id = vim.api.nvim_create_augroup("vim-mode-leds", { clear = true })
local mother = {}
-- normal
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:n*' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.normal)
    vim.w.vml_store = mother.colors.normal
  end
})

-- visual
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:[vV\x16]*' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.visual)
    vim.w.vml_store = mother.colors.visual
  end
})

-- select
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:[sS\x13]*' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.select)
    vim.w.vml_store = mother.colors.select
  end
})

-- insert
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:i*' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.insert)
    vim.w.vml_store = mother.colors.insert
  end
})

-- cmdline
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:c' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.cmdline)
    vim.w.vml_store = mother.colors.cmdline
  end
})

-- ex
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:cv' },
  group = group_id,
  callback = function ()
    mother.set_led(mother.colors.ex)
    vim.w.vml_store = mother.colors.ex
  end
})

-- terminal
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:t' },
  group = group_id,
  callback = function ()
    mother.sed_led(mother.colors.terminal)
    vim.w.vml_store = mother.colors.terminal
  end
})

-- idle
vim.api.nvim_create_autocmd({"FocusLost", "VimLeave", "VimSuspend"}, {
  pattern = { '*' },
  group = group_id,
  callback = function()
    mother.set_led(mother.colors.idle)
  end
})

vim.api.nvim_create_autocmd("FocusGained", {
  pattern = { '*' },
  group = group_id,
  callback = function ()
    if vim.w.vml_store == nil then
      mother.set_led(mother.colors.normal)
      vim.w.vml_store = mother.colors.normal
    else
      mother.set_led(vim.w.vml_store)
    end
  end
})
