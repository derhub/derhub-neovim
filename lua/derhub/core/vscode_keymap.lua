local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- ========================================
-- BASIC VIM IMPROVEMENTS
-- ========================================

-- System clipboard integration
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- Move text up and down
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- Better editing experience
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts) -- Remove search highlighting
keymap('v', 'p', '"_dP', opts)              -- Paste preserves yanked text

-- ========================================
-- FILE & WORKSPACE MANAGEMENT
-- ========================================

-- Quick access
-- show all active editors sort by recently used
keymap({ 'n', 'v' }, '<leader><leader>', "<cmd>lua require('vscode').action('workbench.action.showAllEditorsByMostRecentlyUsed')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>", opts)

-- code search
keymap({ 'n', 'v' }, '<leader>fs', "<cmd>lua require('vscode').action('search.action.openNewEditorFromView')<CR>", opts)

-- File operations
keymap({ 'n', 'v' }, '<leader>e', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>fr', "<cmd>lua require('vscode').action('workbench.action.openRecent')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>w', "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>", opts)

-- Editor management
keymap({ 'n', 'v' }, '<leader>qq', "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>qa', "<cmd>lua require('vscode').action('workbench.action.closeAllEditors')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>qr', "<cmd>lua require('vscode').action('workbench.action.reopenClosedEditor')<CR>", opts)

-- ========================================
-- WINDOW & SPLIT MANAGEMENT
-- ========================================
keymap({ 'n', 'v' }, '<leader>v', "<cmd>lua require('vscode').action('workbench.action.splitEditor')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>h', "<cmd>lua require('vscode').action('workbench.action.splitEditorOrthogonal')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>o', "<cmd>lua require('vscode').action('workbench.action.focusNextGroup')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>x', "<cmd>lua require('vscode').action('workbench.action.closeEditorsInGroup')<CR>", opts)

-- ========================================
-- SEARCH & REPLACE
-- ========================================
keymap({ 'n', 'v' }, '<leader>fg', "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>fR', "<cmd>lua require('vscode').action('workbench.action.replaceInFiles')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>fw', "<cmd>lua require('vscode').action('editor.action.addSelectionToNextFindMatch')<CR>", opts)

-- ========================================
-- CODE NAVIGATION & SYMBOLS
-- ========================================

-- Go to definitions
keymap({ 'n', 'v' }, 'gd', "<cmd>lua require('vscode').action('editor.action.peekDefinition')<CR>", opts)
keymap({ 'n', 'v' }, 'gi', "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>", opts)
keymap({ 'n', 'v' }, 'gr', "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>", opts)

-- Call hierarchy and symbols
keymap({ 'n', 'v' }, 'gh', "<cmd>lua require('vscode').action('references-view.showCallHierarchy')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>os', "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>s', "<cmd>lua require('vscode').action('workbench.action.showAllSymbols')<CR>", opts)

-- ========================================
-- CODE EDITING & FORMATTING
-- ========================================

-- Language features
keymap({ 'n', 'v' }, 'gw', "<cmd>w<cr>", opts)
keymap({ 'n', 'v' }, 'ga', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opts)
keymap({ 'n', 'v' }, 'gq', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>d', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opts)

-- Refactoring
keymap({ 'n', 'v' }, '<leader>rr', "<cmd>lua require('vscode').action('editor.action.rename')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>rf', "<cmd>lua require('vscode').action('editor.action.refactor')<CR>", opts)

-- ========================================
-- DEBUGGING
-- ========================================
keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", opts)

-- ========================================
-- GIT INTEGRATION
-- ========================================
keymap({ 'n', 'v' }, '<leader>gg', "<cmd>lua require('vscode').action('workbench.view.scm')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>gc', "<cmd>lua require('vscode').action('git.commit')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>gp', "<cmd>lua require('vscode').action('git.push')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>gl', "<cmd>lua require('vscode').action('git.pull')<CR>", opts)

-- ========================================
-- TERMINAL
-- ========================================
keymap({ 'n', 'v' }, '<leader>tt', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>tn', "<cmd>lua require('vscode').action('workbench.action.terminal.new')<CR>", opts)

-- ========================================
-- UI & VIEW TOGGLES
-- ========================================
keymap({ 'n', 'v' }, 'zz', "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>m', "<cmd>lua require('vscode').action('editor.action.toggleMinimap')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>tb', "<cmd>lua require('vscode').action('breadcrumbs.toggle')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>tw', "<cmd>lua require('vscode').action('editor.action.toggleWordWrap')<CR>", opts)

-- ========================================
-- NOTIFICATIONS & CLEANUP
-- ========================================
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>", opts)
