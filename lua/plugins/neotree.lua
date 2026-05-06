return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,

			default_component_configs = {
				git_status = {
					symbols = {
						added = "+",
						modified = "~",
						deleted = "-",
						renamed = "→",
						untracked = "?",
						ignored = "!",
						unstaged = "•",
						staged = "✓",
						conflict = "×",
					},
				},
			},

			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},

			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		})

		vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { silent = true })
	end,
}
