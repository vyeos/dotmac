return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float({
					scope = "line",
					border = "single",
					focusable = false,
					relative = "cursor",
					row = 1,
					col = 0,
				})
			end, opts)

			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					runtime = { version = "LuaJIT" },
				},
			},
		})

		local servers = { "pyright", "ts_ls", "html", "cssls", "gopls", "pylsp", "tailwindcss", "clangd" }
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"clangd",
				"tailwindcss",
				"rust_analyzer",
			},
		})
	end,
}
