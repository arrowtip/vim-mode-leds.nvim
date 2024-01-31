local M = { path_to_leds = "", colors = {} }

function M.setup(opts)
  opts = opts or { colors = {}, path_to_leds = "/dev/ttyACM0" }
  opts.colors = opts.colors or {}
  M.path_to_leds = opts.path_to_leds or "/dev/ttyACM0"
  M.colors.normal = opts.colors.normal or "\\x03"
  M.colors.visual = opts.colors.visual or "\\x3c"
  M.colors.select = opts.colors.select or "\\x0c"
  M.colors.insert = opts.colors.insert or "\\xff"
  M.colors.cmdline = opts.colors.cmdline or "\\x30"
  M.colors.ex = opts.colors.ex or "\\x34"
  M.colors.terminal = opts.colors.terminal or "\\x33"
  M.colors.idle = opts.colors.idle or "\\x00"
end

function M.set_led(chr)
  local str = 'printf "' .. chr .. '" > ' .. M.path_to_leds
  pcall(vim.fn.jobstart(str))
end

vim.api.nvim_create_user_command(
  'SetLED',
  function(opts)
    M.set_led(opts.fargs[1])
  end, {
    nargs = 1,
    desc = "Set LEDs to given color"
  }
)

require('vim-mode-leds.mode-detection').add_autocmds(M.colors, M.set_led)

return M
