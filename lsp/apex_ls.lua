local util = require("lspconfig.util")

---@type vim.lsp.Config
return {
  filetypes = { "java", "trigger", "apex" },
  root_dir = util.root_pattern,
  apex_jar_path = vim.fn.expand("$HOME/lib/apex-jorje-lsp.jar"),
  apex_enable_semantic_errors = true,      -- Whether to allow Apex Language Server to surface semantic errors
  apex_enable_completion_statistics = true, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
  on_new_config = function(config)
    if not config.cmd and config.apex_jar_path then
      config.cmd = {
        vim.env.JAVA_HOME and (vim.env.JAVA_HOME .. "/bin/java") or "java",
        "-cp",
        config.apex_jar_path,
        "-Ddebug.internal.errors=true",
        "-Ddebug.semantic.errors=" .. tostring(config.apex_enable_semantic_errors or false),
        "-Ddebug.completion.statistics=" .. tostring(config.apex_enable_completion_statistics or false),
        "-Dlwc.typegeneration.disabled=true",
      }
      if config.apex_jvm_max_heap then
        table.insert(config.cmd, "-Xmx" .. config.apex_jvm_max_heap)
      end
      table.insert(config.cmd, "apex.jorje.lsp.ApexLanguageServerLauncher")
    end
  end,
}
