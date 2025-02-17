return{
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ -- nice loading notifications
			-- PERF: but can slow down startup
			"j-hui/fidget.nvim",
			enabled = false,
			opts = {},
		},
		{ "folke/neodev.nvim", opts = {}, enabled = true },
		{ "folke/neoconf.nvim", opts = {}, enabled = false },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
			},
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.emmet_language_server.setup({
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.yamlls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "",
					},
				},
			},
		})

		lspconfig.dotls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
			filetypes = { "js", "javascript", "typescript", "ojs" },
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
			mason = false,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					runtime = {
						version = "LuaJIT",
						plugin = lua_plugin_paths,
					},
					diagnostics = {
						globals = { "vim", "pandoc", "io", "string", "print", "require", "table" },
						disable = { "trailing-space" },
					},
					workspace = {
						library = lua_library_files,
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lspconfig.bashls.setup({
			capabilities = capabilities,
			flags = lsp_flags,
			filetypes = { "sh", "bash" },
		})

--		lspconfig.clangd.setup({
--			capabilities = capabilities,
--			flags = lsp_flags,
--		})

	end
}

