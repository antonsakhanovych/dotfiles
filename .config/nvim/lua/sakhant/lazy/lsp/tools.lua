return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        local formatters = {
            "prettier",
            "isort"
        }
        require("mason-tool-installer").setup {
            ensure_installed = formatters
        }
    end
}
