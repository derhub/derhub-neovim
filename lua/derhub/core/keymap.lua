-- default keymap options with description
function WithDefaultOpts(description)
  return { desc = description, silent = true, noremap = true }
end

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<S-Up>', 'yyddkP', WithDefaultOpts 'move line up')
vim.keymap.set('n', '<S-Down>', 'yyddkp', WithDefaultOpts 'move line down')

vim.keymap.set('n', '<C-d>', 'yyp', WithDefaultOpts 'duplicatre line')

-- split windows
vim.keymap.set('n', '<leader>pv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>ph', '<C-w>s', { desc = 'split window horizontally' })
vim.keymap.set('n', '<leader>pe', '<C-w>=', { desc = 'make split window equal size' })
