local M = {}
local path_to_leds

print("hello from lua init")
function M.setup(opts)
  opts = opts or {}
  if opts.path_to_leds then
    path_to_leds = opts.path_to_leds
  else
    M.path_to_leds = '/dev/ttyACM0'
  end
end

require('vim-mode-leds.mode-detection')

local function set_led(chr)
  local job = vim.fn.jobstart('echo "' .. chr .. '" > ' .. M.path_to_leds)
end

vim.api.nvim_create_user_command(
  'LedMode',
  function(opts)
    set_led(opts.fargs[1])
  end,
  {
    nargs = 1,
    desc = "Set LEDs to given mode"
  }
)
return M
