return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			["python"] = { "black", "ruff" },
			-- python = { "ruff" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
		},
		formatters = {
			clang_format = {
				command = "clang-format",
				-- используем assume-filename чтобы clang-format подбирал стиль по имени файла
				args = { "--assume-filename", "$FILENAME" },
				-- (опционально) если хочешь, можно добавить range_args для conform,
				-- но ниже я дам более надёжный keymap для выделения.
			},
			-- prettier = {
			-- 	command = "prettier",
			-- 	-- Автоматически найдет локальный prettier,
			-- 	-- если он есть в node_modules/.bin
			-- 	cwd = function()
			-- 		return vim.fn.getcwd()
			-- 	end,
			-- },
		},
		-- можно также включить автоматическое форматирование при сохранении:
		-- format_on_save = true,
	},
}
