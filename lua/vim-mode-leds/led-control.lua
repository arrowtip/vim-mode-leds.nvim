local path_to_leds = '/dev/ttyACM0'

local function set_led(chr)
  local job = vim.fn.jobstart('echo "' .. chr .. '" > ' .. path_to_leds)
end

vim.api.nvim_create_user_command(
  'LedMode',
  function(opts)
    print("LED mode: " .. opts.fargs[1])
    if opts.fargs[1] ~= '0' then
      print("storing value "..opts.fargs[1])
      vim.api.nvim_win_set_var(0, 'LedMode', opts.fargs[1])
    end
    set_led(opts.fargs[1])
    print(vim.api.nvim_win_get_var(0, 'LedMode'))
  end,
  {
    nargs = 1,
    desc = "Set LEDs to given mode"
  }
)
