return {
  "zbirenbaum/copilot.vim",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
}
