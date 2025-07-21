return {
  'Mofiqul/vscode.nvim',
  priority = 1000, -- Ensure it loads first
  config = function()
    vim.cmd('colorscheme vscode')
    vim.o.background = 'dark'
  end
}
