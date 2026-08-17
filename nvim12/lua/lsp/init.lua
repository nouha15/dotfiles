require('lsp.pyright')
require('lsp.lua_ls')
require('lsp.clangd')
require('lsp.vtsls')
require('lsp.eslint')


vim.lsp.config('*', {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			}
		}
	},
	root_markers = { '.git' },
})


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		local map = function(mode, lhs, rhs, desc)
			opts.desc = desc
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map('n', 'gd', vim.lsp.buf.definition, "Goto Definition")
		map('n', 'gr', vim.lsp.buf.references, "References")
		map('n', 'gI', vim.lsp.buf.implementation, "Goto Implementation")
		map('n', 'gy', vim.lsp.buf.type_definition, "Type Definition")
		map('n', 'gD', vim.lsp.buf.declaration, "Goto Declaration")
		map('n', 'K', vim.lsp.buf.hover, "Hover")
		map('n', 'gK', vim.lsp.buf.signature_help, "Signature Help")
		map('i', '<c-k>', vim.lsp.buf.signature_help, "Signature Help")
		map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, "Code Action")
		map('n', '<leader>cr', vim.lsp.buf.rename, "Rename")
		-- map('n', "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
	end,
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"clangd",
	"vtsls",
	"eslint",
})

-- vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({
	-- Подчеркивание ошибок
	underline = true,

	-- Обновление в реальном времени
	update_in_insert = true,

	-- Виртуальный текст справа
	virtual_text = {
		spacing = 4,
		source = "always", -- всегда показывать источник
		prefix = "■", -- можно использовать любой символ
	},
	severity_sort = true,
	-- Показывать значки на полях (нужен настроенный sign column)
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},

	-- Показывать диагностику во всплывающем окне при наведении
	float = {
		source = true,
		border = "rounded",
	},
	folds = {
		enabled = true,
	},
})






-- icons used by other plugins
-- icons = {
--   misc = {
--     dots = "󰇘",
--   },
--   ft = {
--     octo = " ",
--     gh = " ",
--     ["markdown.gh"] = " ",
--   },
--   dap = {
--     Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
--     Breakpoint          = " ",
--     BreakpointCondition = " ",
--     BreakpointRejected  = { " ", "DiagnosticError" },
--     LogPoint            = ".>",
--   },
--   diagnostics = {
--     Error = " ",
--     Warn  = " ",
--     Hint  = " ",
--     Info  = " ",
--   },
--   git = {
--     added    = " ",
--     modified = " ",
--     removed  = " ",
--   },
--   kinds = {
--     Array         = " ",
--     Boolean       = "󰨙 ",
--     Class         = " ",
--     Codeium       = "󰘦 ",
--     Color         = " ",
--     Control       = " ",
--     Collapsed     = " ",
--     Constant      = "󰏿 ",
--     Constructor   = " ",
--     Copilot       = " ",
--     Enum          = " ",
--     EnumMember    = " ",
--     Event         = " ",
--     Field         = " ",
--     File          = " ",
--     Folder        = " ",
--     Function      = "󰊕 ",
--     Interface     = " ",
--     Key           = " ",
--     Keyword       = " ",
--     Method        = "󰊕 ",
--     Module        = " ",
--     Namespace     = "󰦮 ",
--     Null          = " ",
--     Number        = "󰎠 ",
--     Object        = " ",
--     Operator      = " ",
--     Package       = " ",
--     Property      = " ",
--     Reference     = " ",
--     Snippet       = "󱄽 ",
--     String        = " ",
--     Struct        = "󰆼 ",
--     Supermaven    = " ",
--     TabNine       = "󰏚 ",
--     Text          = " ",
--     TypeParameter = " ",
--     Unit          = " ",
--     Value         = " ",
--     Variable      = "󰀫 ",
