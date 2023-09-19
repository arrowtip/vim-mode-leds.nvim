local path_to_leds = '/dev/ttyACM0'

local function set_led(chr)
  local ok, _ = pcall(os.execute, 'echo ' .. chr .. ' > ' .. path_to_leds)
  if not ok then
    print("could not reach LEDs")
  end
end

vim.api.nvim_create_user_command(
  'LedMode',
  function(opts)
    print("led normal mode")
    set_led(opts.fargs[1])
  end,
  {
    nargs = 1,
    desc = "Set LEDs to given mode"
  }
)
