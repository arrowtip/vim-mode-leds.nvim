# vim-mode-leds
## Usage
### Packer
```lua
use { arrowtip/vim-mode-leds.nvim }

    -- usually path will be /dev/ttyACM0
require("vim-mode-leds").setup({ path_to_leds = "path/to/led/device/file" })
```
