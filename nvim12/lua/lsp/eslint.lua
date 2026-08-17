-- lua/lsp/configs/eslint.lua
local eslint_config = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	settings = {
		-- Настройка для поддержки Flat Config (ESLint v9+)
		useFlatConfig = true,
		experimental = {
			useFlatConfig = false,
		},
		validate = "on",
		codeAction = {
			enable = true,
			mode = "all",
		},
		-- Для корректной работы в монорепозиториях или с разными версиями ESLint
		workingDirectory = { mode = "location" },
	},
	-- -- autofix on save
	-- on_attach = function(client, bufnr)
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		buffer = bufnr,
	-- 		command = "EslintFixAll",
	-- 	})
	-- end,
}

vim.lsp.config("eslint", eslint_config)
