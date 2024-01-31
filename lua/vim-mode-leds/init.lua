local M = {}

function M.setup(opts)
  opts = opts or {}
  opts.colors = opts.colors or {}
  M.path_to_leds = opts.path_to_leds or "/dev/ttyACM0"
  if opts.colors then
    M.colors.normal = opts.colors.normal or "\\x03"
    M.colors.visual = opts.colors.visual or "\\x3c"
    M.colors.select = opts.colors.select or "\\x0c"
    M.colors.insert = opts.colors.insert or "\\xff"
    M.colors.cmdline = opts.colors.cmdline or "\\x34"
    M.colors.ex = opts.colors.ex or "\\x30"
    M.colors.terminal = opts.colors.terminal or "\\x33"
    M.colors.idle = opts.colors.idle or "\\x00"
  end
end

--require('vim-mode-leds.mode-detection')

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function M.set_led(chr)
  if file_exists(M.path_to_leds) then
    local str = 'printf "' .. chr .. '" > ' .. M.path_to_leds
    print(str)
    vim.fn.jobstart(str)
  end
end

vim.api.nvim_create_user_command(
  'SetLED',
  function(opts)
    M.set_led(opts.fargs[1])
  end,
  {
    nargs = 1,
    desc = "Set LEDs to given color"
  }
)
return M
