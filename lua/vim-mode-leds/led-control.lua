local path_to_leds = '/dev/ttyACM0'

local function set_led(chr)
  local job = vim.fn.jobstart('echo "' .. chr .. '" > ' .. path_to_leds)
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
