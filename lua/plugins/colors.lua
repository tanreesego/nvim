return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon", -- "main", "moon", or "dawn"
			styles = {
				transparency = true, -- keeps your ghostty background
			},
		})
		vim.cmd("colorscheme rose-pine")
		-- vim.api.nvim_set_hl(0, "normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" }) -- main float bg
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#89b4fa" }) -- border color
	end,
}
