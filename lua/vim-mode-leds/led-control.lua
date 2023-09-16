local path_to_leds = '/dev/ttyACM0'

local function set_led(chr)
  local ok, _ = pcall(os.execute, 'echo ' .. chr .. ' > ' .. path_to_leds)
  if not ok then
    print("could not reach LEDs")
  end
end

vim.api.nvim_create_user_command(
  'LedModeNormal',
  function()
    print("led normal mode")
    set_led('0')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display normal mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeVisual',
  function()
    print("led visual mode")
    set_led('1')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display visual mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeSelect',
  function()
    print("led select mode")
    set_led('2')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display select mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeInsert',
  function()
    print("led insert mode")
    set_led('3')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display insert mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeCmd',
  function()
    print("led cmd mode")
    set_led('4')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display cmdline mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeEx',
  function()
    print("led ex mode")
    set_led('5')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display ex mode"
  }
)

vim.api.nvim_create_user_command(
  'LedModeTerminal',
  function()
    print("led terminal mode")
    set_led('6')
  end,
  {
    nargs = 0,
    desc = "Set LEDs to display terminal mode"
  }
)
