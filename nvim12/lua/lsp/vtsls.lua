local vtsls_config = {
    cmd = { "vtsls", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_markers = {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git",
    },
    settings = {
        vtsls = {
            -- Включить перемещение кода в новый файл
            enableMoveToFileCodeAction = true,
            -- Автоматически использовать TypeScript из рабочей области, если он есть
            autoUseWorkspaceTsdk = true,
            experimental = {
                completion = {
                    enableServerSideFuzzyMatch = true,
                    entriesLimit = 20,
                },
            },
        },
        typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
                completeFunctionCalls = true,
            },
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
            tsserver = {
                useSeparateSyntaxServer = true,
                experimental = {
                    enableProjectDiagnostics = true,
                },
            },
            format = {
                -- Отключить форматирование от vtsls, если используете ESLint или Prettier
                enable = false,
            },
        },
    },
}

vim.lsp.config('vtsls', vtsls_config)
