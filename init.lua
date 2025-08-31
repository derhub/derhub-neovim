require 'derhub.core.options'

if vim.g.vscode then
  -- VSCode extension
  require 'derhub.core.vscode_keymap'
else
  require 'derhub.core.keymap'
  -- ordinary Neovim
  require 'derhub.lazy'
  require 'derhub.core'
end
