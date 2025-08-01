return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local term = require 'toggleterm'

    term.setup {
      size = 20,
      hide_numbers = true,
      open_mapping = [[<C-\>]],
      direction = 'horizontal',
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      close_on_exit = true,
      shell = vim.o.shell,
    }

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    vim.keymap.set('t', '<C-h>', '<Cmd>ToggleTerm size=10 direction=horizontal<CR>', { desc = 'New terminal horizontal', silent = true, noremap = true })
    vim.keymap.set('t', '<C-v>', '<Cmd>ToggleTerm size=10 direction=vertical<CR>', { desc = 'New terminal vertical', silent = true, noremap = true })
  end,
}
