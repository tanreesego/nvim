return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "black" },
				lua = { "stylua" },
				sh = { "shfmt" },
				zig = { "zigfmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = true, -- fallback to LSP if no formatter found
			},
		})
	end,
}
