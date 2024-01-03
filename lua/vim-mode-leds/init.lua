local M = {}

function M.setup(opts)
  opts = opts or {}
  if opts.path_to_leds then
    M.path_to_leds = opts.path_to_leds
  else
    M.path_to_leds = '/dev/ttyACM0'
  end
end

require('vim-mode-leds.mode-detection')

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local function set_led(chr)
  if file_exists(M.path_to_leds) then
    vim.fn.jobstart('echo "' .. chr .. '" > ' .. M.path_to_leds)
  end
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
