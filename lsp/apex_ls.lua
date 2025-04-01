return {
	filetypes = { "java", "trigger", "apex" },
	apex_jar_path = vim.fn.expand("$HOME/lib/apex-jorje-lsp.jar"),
	apex_enable_semantic_errors = true, -- Whether to allow Apex Language Server to surface semantic errors
	apex_enable_completion_statistics = true, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
}
