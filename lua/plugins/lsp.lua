return {
	{
		-- Main LSP plugin
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Mason installs LSP servers
			{ "williamboman/mason.nvim", opts = {} },
			-- Bridges Mason with nvim-lspconfig
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- ================================
			-- Function to create buffer-local LSP keymaps
			-- ================================
			local on_attach = function(client, bufnr)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
				end

				-- Normal mode keymaps
				map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
				map("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")

				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<C-h>", vim.lsp.buf.signature_help, "Signature Help", "i")

				map("<leader>vws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbol")
				map("<leader>vd", vim.diagnostic.open_float, "[D]iagnostics")

				map("<leader>vca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("<leader>vrn", vim.lsp.buf.rename, "[R]e[n]ame")

				map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
				map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")

				map("<leader>vh", vim.lsp.buf.document_highlight, "LSP Buf Reference Highlight")
				map("<leader>vc", vim.lsp.buf.clear_references, "Clear LSP Buf Reference Highlight")

				-- Highlight word under cursor
				-- if client.supports_method("textDocument/documentHighlight") then
				-- 	local group = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = false })
				-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				-- 		buffer = bufnr,
				-- 		group = group,
				-- 		callback = vim.lsp.buf.document_highlight,
				-- 	})
				-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				-- 		buffer = bufnr,
				-- 		group = group,
				-- 		callback = vim.lsp.buf.clear_references,
				-- 	})
				-- 	vim.api.nvim_create_autocmd("LspDetach", {
				-- 		buffer = bufnr,
				-- 		group = group,
				-- 		callback = function()
				-- 			vim.lsp.buf.clear_references()
				-- 			vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
				-- 		end,
				-- 	})
				-- end
			end

			-- ================================
			-- LSP server configurations
			-- ================================
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				lua_ls = {}, -- Lua
				pyright = { -- Python
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
				zls = {}, -- Zig
				-- web dev
				svelte = {},
				ts_ls = {},
				cssls = {},
				html = {},
				jsonls = {},
			}

			-- Automatically install servers via Mason
			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			-- Setup each LSP server (new API)
			for name, opts in pairs(servers) do
				opts.on_attach = on_attach
				opts.capabilities = capabilities
				vim.lsp.config(name, opts)
			end

			-- Enable them
			vim.lsp.enable(vim.tbl_keys(servers))

			-- ================================
			-- Global diagnostic settings
			-- ================================
			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
				},
			})
		end,
	},
}
