local M = {}

function M.add_autocmds(colors, set_func)
local group_id = vim.api.nvim_create_augroup("vim-mode-leds", { clear = true })
-- normal
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:n*' },
    group = group_id,
    callback = function ()
      set_func(colors.normal)
      vim.w.vml_store = colors.normal
    end
  })

  -- visual
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:[vV\x16]*' },
    group = group_id,
    callback = function ()
      set_func(colors.visual)
      vim.w.vml_store = colors.visual
    end
  })

  -- select
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:[sS\x13]*' },
    group = group_id,
    callback = function ()
      set_func(colors.select)
      vim.w.vml_store = colors.select
    end
  })

  -- insert
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:i*' },
    group = group_id,
    callback = function ()
      set_func(colors.insert)
      vim.w.vml_store = colors.insert
    end
  })

  -- cmdline
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:c' },
    group = group_id,
    callback = function ()
      set_func(colors.cmdline)
      vim.w.vml_store = colors.cmdline
    end
  })

  -- ex
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:cv' },
    group = group_id,
    callback = function ()
      set_func(colors.ex)
      vim.w.vml_store = colors.ex
    end
  })

  -- terminal
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { '*:t' },
    group = group_id,
    callback = function ()
      set_func(colors.terminal)
      vim.w.vml_store = colors.terminal
    end
  })

  -- idle
  vim.api.nvim_create_autocmd({"FocusLost", "VimLeave", "VimSuspend"}, {
    pattern = { '*' },
    group = group_id,
    callback = function()
      set_func(colors.idle)
    end
  })

  -- restore after regain of focus
  vim.api.nvim_create_autocmd("FocusGained", {
    pattern = { '*' },
    group = group_id,
    callback = function ()
      if vim.w.vml_store == nil then
        set_func(colors.normal)
        vim.w.vml_store = colors.normal
      else
        set_func(vim.w.vml_store)
      end
    end
  })
end

return M
