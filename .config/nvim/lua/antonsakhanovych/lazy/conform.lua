return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                css = { "prettier" },
                html = { "prettier --tab-width 4" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "astyle" },
                cpp = { "astyle" },
                ocaml = { "ocamlformat" }
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })
        conform.formatters.ocamlformat = {
            prepend_args = {
                "--if-then-else",
                "vertical",
                "--break-cases",
                "fit-or-vertical",
                "--type-decl",
                "sparse",
            }
        }
        conform.formatters.astyle = {
            prepend_args = function(self, ctx)
                return { "--style=kr", "-s4" }
            end,
        }
    end,
}
