return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "apex" },
          extra_args = {
            "--plugin=prettier-plugin-apex"
          }
         }),
        null_ls.builtins.diagnostics.pmd.with({
          extra_filetypes = { "apex" },
          method = null_ls.methods.DIAGNOSTICS,
          args = { "--format", "json", "--dir", "$FILENAME", "--no-progress", "--no-cache" },
          extra_args = {
            "--rulesets",
            "category/apex/security.xml,,category/apex/codestyle.xml,category/apex/bestpractices.xml",
          },
        }),
        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
  end,
}
