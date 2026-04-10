require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }

vim.lsp.enable('ts_ls')
vim.lsp.enable('angularls')

vim.lsp.enable(servers)

vim.lsp.enable('pyright')

vim.lsp.enable('rust_analyzer')
-- read :h vim.lsp.config for changing options of lsp servers 

