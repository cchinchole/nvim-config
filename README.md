# My Nvim configuration #
## Install Reqs ##
pacman -S npm ripgrep wget nodejs fzf unzip\
\

## Keybinds ##
### Sessionizer ###
ctrl-f          - Sessionizer\

### Splits ###
alt-h,j,k,l     - Selects the buffer\
ctrl-h,j,k,l    - Resizes the buffer\

### Visual ###
J               - Move selection up\
K               - Move selection down\
\<              - Move selection left\
\>              - Move selection right\

### Selection ###
ctrl-c          - Stop highlighting / escape insert\

### Auto completion ###
ctrl-n          - Next item\
ctrl-p          - Previous item\
enter           - Confirms choice\

### Oil ###
ctrl-o          - Toggle oil\

### Terminal ###
Ctrl t          - Open / close terminal\
Esc             - Exit terminal insert mode\

### LSP ###
gd              - Go to definition\
gD              - Go to declaration\
gr              - Show references\
gi              - Go to implementation\
gt              - Goto type definition\
]]              - Next reference\
[[              - Previous reference\
leader rn       - Rename Symbol\
leader f        - Format\

### Conform ###
leader l        - Format\

### Harpoon ###
alt a           - Add current file to tags\
alt e           - Open tag explorer\
alt w           - Remove current file from tags\
alt 1-5         - Jump to file\

### Neogit ###
leader gg       - Open neogit\
leader gh       - Show diffview\

### Undotree ###
leader ut       - Show undotree\

### Search ###
leader e        - Fuzzy find files\
leader pg       - Fuzzy find git files\
leader pw       - Grep find current selected word\
leader pr       - Grep find current selected WORD\
leader ps       - Grep search\
leader sf       - Find symbols (current file)\
leader sg       - Find symbols (workspace)\
leader uc       - Search color schemes\
