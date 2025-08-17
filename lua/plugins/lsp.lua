return {
	{
		"mason-org/mason.nvim",
		version = "^1.0.0",
		lazy = false,
		dependencies = {
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
			"neovim/nvim-lspconfig",
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
			"stevearc/conform.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"cmake",
					"clangd",
					"tinymist",
				},
			})

			require("lspconfig").clangd.setup({})
			require("lspconfig").pyright.setup({})
			require("lspconfig").cmake.setup({})
			require("lspconfig")["tinymist"].setup({
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onType",
					semanticTokens = "disable",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local builtin = require("telescope.builtin")
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					--vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
					--vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
					--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					--vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })
				end,
			})

			require("commander").add({
				{
					desc = "Telescope LSP definitions",
					cmd = "<CMD>Telescope lsp_definitions<CR>",
					keys = { "n", "gd", noremap },
				},
				{
					desc = "LSP declaration",
					cmd = vim.lsp.buf.declaration,
					keys = { "n", "gD", noremap },
				},
				{
					desc = "Telescope document symbols",
					cmd = "<CMD>Telescope lsp_document_symbols<CR>",
					keys = { "n", "gs" },
				},
				{
					desc = "Telescope LSP references",
					cmd = "<CMD>Telescope lsp_references<CR>",
					keys = { "n", "gr", noremap },
				},
				{
					desc = "Telescope workspace symbols",
					cmd = "<CMD>Telescope lsp_workspace_symbols<CR>",
					keys = { "n", "gS", noremap },
				},
				{
					desc = "Telescope type definitions",
					cmd = "<CMD>Telescope lsp_type_definitions<CR>",
					keys = { "n", "gS", noremap },
				},
			})

			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

			vim.keymap.set("", "<leader>l", function()
				local config = vim.diagnostic.config() or {}
				if config.virtual_text then
					vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
				else
					vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
				end
			end, { desc = "Toggle lsp_lines" })

			require("conform").setup({
				formatters_by_ft = {
					python = { "black" },
					c = { "clang-format" },
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
