# vim-mode-leds
## Usage
### Packer
Add the plugin to packer:
```lua
use { arrowtip/vim-mode-leds.nvim }
```

And configure it (both `path_to_leds` and `colors` are optional):
```lua
require("vim-mode-leds").setup({ 
    -- usually path will be /dev/ttyACM0
    path_to_leds = "path/to/led/device/file",
    -- colors are 8bit hexadecimal WRGB values
    colors = {
        normal = "\\x03" -- blue
        visual = "\\x3c" -- yellow
        select = "\\x0c" -- green
        insert = "\\xff" -- white
        cmdline = "\\x30" -- red
        ex = "\\x34" -- orange
        terminal = "\\x33" -- purple
        idle = "\\x00" -- off
    }})
```

### Troubleshooting:
Check the permission of the device. 
Your device should be writable by the user.
This is an easy fix:
```bash
usermod -a -G uucp $USER
chmod g+w /dev/ttyACM0
```


