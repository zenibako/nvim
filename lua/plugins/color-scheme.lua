return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    -- vim.cmd('set termguicolors')
    -- vim.g.sonokai_style = 'atlantis'
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_transparent_background = 1
    vim.cmd.colorscheme('sonokai')
  end
}
