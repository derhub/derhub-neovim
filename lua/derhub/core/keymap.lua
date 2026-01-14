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

-- ========================================
-- Synced keymaps with VSCode-Neovim setup
-- ========================================

-- System clipboard integration
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', WithDefaultOpts 'Yank to system clipboard')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', WithDefaultOpts 'Paste from system clipboard')

-- Move text up and down (visual)
vim.keymap.set('v', 'J', ':m .+1<CR>==', WithDefaultOpts 'Move selection down')
vim.keymap.set('v', 'K', ':m .-2<CR>==', WithDefaultOpts 'Move selection up')
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", WithDefaultOpts 'Move block down')
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", WithDefaultOpts 'Move block up')

-- Better editing experience
vim.keymap.set('v', 'p', '"_dP', WithDefaultOpts 'Paste without overwriting register')

-- Quick access
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.buffers() else vim.cmd('ls') end
end, WithDefaultOpts 'Show buffers (recently used)')
vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.find_files() else vim.cmd('find .') end
end, WithDefaultOpts 'Quick open files')
vim.keymap.set({ 'n', 'v' }, '<leader>cp', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok and tb.commands then tb.commands() else vim.cmd('help :command') end
end, WithDefaultOpts 'Show commands')

-- Code search
vim.keymap.set({ 'n', 'v' }, '<leader>fs', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.live_grep() else vim.cmd('/') end
end, WithDefaultOpts 'Search in files')
vim.keymap.set({ 'n', 'v' }, '<leader>fg', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.live_grep() else vim.cmd('/') end
end, WithDefaultOpts 'Find in files')
vim.keymap.set('n', '<leader>fR', ':%s///g<Left><Left><Left>', WithDefaultOpts 'Replace in file')

-- File operations
vim.keymap.set({ 'n', 'v' }, '<leader>e', function()
  if pcall(require, 'nvim-tree') then
    vim.cmd('NvimTreeToggle')
  else
    vim.cmd('Ex')
  end
end, WithDefaultOpts 'Toggle file explorer')
vim.keymap.set({ 'n', 'v' }, '<leader>fr', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.oldfiles() else vim.cmd('browse oldfiles') end
end, WithDefaultOpts 'Open recent files')
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<cmd>w<CR>', WithDefaultOpts 'Save file')

-- Editor management
vim.keymap.set({ 'n', 'v' }, '<leader>qq', '<cmd>bd<CR>', WithDefaultOpts 'Close current buffer')
vim.keymap.set({ 'n', 'v' }, '<leader>qa', '<cmd>%bd|e#|bd#<CR>', WithDefaultOpts 'Close all buffers')
vim.keymap.set({ 'n', 'v' }, '<leader>qr', '<cmd>e #<CR>', WithDefaultOpts 'Reopen last buffer')

-- Window & split management (additional aliases to match VSCode)
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<C-w>v', WithDefaultOpts 'Split window vertically')
vim.keymap.set({ 'n', 'v' }, '<leader>h', '<C-w>s', WithDefaultOpts 'Split window horizontally')
vim.keymap.set({ 'n', 'v' }, '<leader>o', '<C-w>w', WithDefaultOpts 'Focus next window')
vim.keymap.set({ 'n', 'v' }, '<leader>x', '<cmd>close<CR>', WithDefaultOpts 'Close window')

-- Code navigation & symbols (LSP/Telescope)
vim.keymap.set({ 'n', 'v' }, 'gd', function() vim.lsp.buf.definition() end, WithDefaultOpts 'Go to definition')
vim.keymap.set({ 'n', 'v' }, 'gi', function() vim.lsp.buf.implementation() end, WithDefaultOpts 'Go to implementation')
vim.keymap.set({ 'n', 'v' }, 'gr', function() vim.lsp.buf.references() end, WithDefaultOpts 'Go to references')
vim.keymap.set({ 'n', 'v' }, 'gh', function()
  local ok = pcall(vim.lsp.buf.incoming_calls)
  if not ok then vim.notify('LSP incoming calls not available', vim.log.levels.WARN) end
end, WithDefaultOpts 'Show call hierarchy (incoming)')
vim.keymap.set({ 'n', 'v' }, '<leader>os', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.lsp_document_symbols() else vim.notify('Telescope not available', vim.log.levels.WARN) end
end, WithDefaultOpts 'Document symbols')
vim.keymap.set({ 'n', 'v' }, '<leader>s', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.lsp_workspace_symbols() else vim.notify('Telescope not available', vim.log.levels.WARN) end
end, WithDefaultOpts 'Workspace symbols')

-- Code editing & formatting
vim.keymap.set({ 'n', 'v' }, 'gw', '<cmd>w<CR>', WithDefaultOpts 'Save file')
vim.keymap.set({ 'n', 'v' }, 'ga', function() vim.lsp.buf.code_action() end, WithDefaultOpts 'Code action')
vim.keymap.set({ 'n', 'v' }, 'gq', function()
  vim.diagnostic.setqflist()
  vim.cmd('copen')
end, WithDefaultOpts 'Open diagnostics (quickfix)')
vim.keymap.set({ 'n', 'v' }, '<leader>d', function() vim.lsp.buf.hover() end, WithDefaultOpts 'Show hover')
vim.keymap.set({ 'n', 'v' }, '<leader>rr', function() vim.lsp.buf.rename() end, WithDefaultOpts 'Rename symbol')
vim.keymap.set({ 'n', 'v' }, '<leader>rf', function() vim.lsp.buf.code_action() end, WithDefaultOpts 'Refactor/code action')

-- Debugging (nvim-dap, if available)
vim.keymap.set({ 'n', 'v' }, '<leader>b', function()
  local ok, dap = pcall(require, 'dap')
  if ok then dap.toggle_breakpoint() else vim.notify('nvim-dap not available', vim.log.levels.WARN) end
end, WithDefaultOpts 'Toggle breakpoint')

-- Git integration (Telescope/git CLI fallbacks)
vim.keymap.set({ 'n', 'v' }, '<leader>gg', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.git_status() else vim.cmd('!git status') end
end, WithDefaultOpts 'Git status')
vim.keymap.set({ 'n', 'v' }, '<leader>gc', function()
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok then tb.git_commits() else vim.cmd('!git log') end
end, WithDefaultOpts 'Git commits')
vim.keymap.set({ 'n', 'v' }, '<leader>gp', '<cmd>!git push<CR>', WithDefaultOpts 'Git push')
vim.keymap.set({ 'n', 'v' }, '<leader>gl', '<cmd>!git pull<CR>', WithDefaultOpts 'Git pull')

-- Terminal
vim.keymap.set({ 'n', 'v' }, '<leader>tt', function()
  if pcall(require, 'toggleterm') then
    vim.cmd('ToggleTerm')
  else
    vim.cmd('terminal')
  end
end, WithDefaultOpts 'Toggle terminal')
vim.keymap.set({ 'n', 'v' }, '<leader>tn', function()
  if pcall(require, 'toggleterm') then
    vim.cmd('ToggleTerm direction=tab')
  else
    vim.cmd('tabnew | terminal')
  end
end, WithDefaultOpts 'New terminal')

-- UI & view toggles
vim.keymap.set({ 'n', 'v' }, '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, WithDefaultOpts 'Toggle word wrap')
vim.keymap.set({ 'n', 'v' }, '<leader>cn', function()
  local ok, notify = pcall(require, 'notify')
  if ok and notify.dismiss then notify.dismiss({ silent = true, pending = true }) end
  vim.cmd('nohlsearch')
end, WithDefaultOpts 'Clear notifications/search highlight')
