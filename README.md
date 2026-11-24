# My Nvim configuration #
Requires Neovim 0.12+ (plugins are managed with the built-in `vim.pack`).

## Install Reqs ##
pacman -S npm ripgrep wget nodejs fzf unzip yazi

## Keybinds ##
Leader is `space`.

### Splits ###
ctrl-h,j,k,l    - Move to split left / down / up / right\
alt-h,l         - Resize split width\
alt-j,k         - Resize split height\
leader v        - Vertical split with a new empty buffer

### Movement ###
ctrl-d / ctrl-u - Half page down / up (cursor centered)\
n / N           - Next / previous search match (centered)

### Visual ###
J               - Move selection down\
K               - Move selection up\
\<              - Indent selection left (keeps selection)\
\>              - Indent selection right (keeps selection)\
p               - Paste over selection without overwriting the register\
leader uh       - Toggle case of hex digits in selection

### Editing ###
x / X           - Delete character without yanking\
leader fr       - Find and replace word under cursor\
Q               - Disabled

### Selection ###
ctrl-c          - Clear search highlight / escape insert

### Auto completion ###
ctrl-n          - Next item\
ctrl-p          - Previous item\
ctrl-space      - Trigger completion\
ctrl-e          - Abort completion\
ctrl-b / ctrl-f - Scroll docs\
enter           - Confirms choice

### Yazi ###
\-              - Toggle yazi

### LSP ###
gd              - Go to definition\
gD              - Go to declaration\
gr              - Show references\
gI              - Go to implementation\
gt              - Go to type definition\
leader rn       - Rename symbol\
leader ca       - Code action

### Conform ###
leader l        - Format

### Neogit ###
leader gg       - Open neogit\
leader gh       - File history (diffview)

### Undotree ###
leader ut       - Toggle undotree

### Search ###
leader e        - Fuzzy find files\
leader pg       - Fuzzy find git files\
leader pw       - Grep word under cursor\
leader pr       - Grep WORD under cursor\
leader ps       - Grep search\
leader sf       - Find symbols (current file)\
leader sg       - Find symbols (workspace)\
leader uc       - Search color schemes
