local mappings = {}
local utils = require'core/utils'

-- uppercase word under cursor
utils.keymap('i', '<c-u>', '<ESC>viwUea')
utils.keymap('n', '<c-u>', 'viwUe<Esc>')

-- save file
utils.keymap('n', '<C-S>', ':w<CR>')

-- quit
utils.keymap('n', '<C-Q>', ':wq!<CR>')

-- better tab in visual mode
utils.keymap('v', '<TAB>', '>gv')
utils.keymap('v', '<S-TAB>', '<gv')

-- better window navigation
utils.keymap('n', '<C-h>', '<C-w>h')
utils.keymap('n', '<C-j>', '<C-w>j')
utils.keymap('n', '<C-k>', '<C-w>k')
utils.keymap('n', '<C-l>', '<C-w>l')
