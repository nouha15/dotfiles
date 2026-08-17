---@type vim.lsp.Config
local clangd_config = {
	--@type lspconfig.settings.clangd
	cmd          = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		"Makefile",
		"configure.ac",
		"configure.in",
		"config.h.in",
		"meson.build",
		"meson_options.txt",
		"build.ninja",
		".git",
	},
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
	settings     = {
		clangd = {
			arguments = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			}
		}
	},

	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
}

vim.lsp.config('clangd', clangd_config)

