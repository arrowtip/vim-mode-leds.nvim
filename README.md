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
You device should be writable from users
This is a easy fix
```
sudo chmod 777 /dev/ttyACM0
```


