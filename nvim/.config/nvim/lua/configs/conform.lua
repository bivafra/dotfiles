local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "autopep8" },
        -- c = { "clang-format" }, -- already in clangd
        -- cpp = { "clang-format" },

        -- gopls uses go-fmt, goimmports = gofmt + imports management
        go = { "goimports" },

        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 100,
        lsp_fallback = true,
    },
    timeout_ms = 100
}

return options
