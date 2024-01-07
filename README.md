# vim-mode-leds
## Usage
### Packer
```lua
use { arrowtip/vim-mode-leds.nvim }

    -- usually path will be /dev/ttyACM0
require("vim-mode-leds").setup({ path_to_leds = "path/to/led/device/file" })
```

### Troubleshooting:
Check the permission of the device. 
Your device should be writable by the user.
This is an easy fix:
```
$ chmod g+w /dev/ttyACM0
```


