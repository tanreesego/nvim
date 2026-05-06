return {
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- auto close tags: <div> → </div>
					enable_rename = true, -- rename closing tag when you edit opening tag
					enable_close_on_slash = false,
				},

				-- per_filetype = {
				-- 	["html"] = {
				-- 		enable_close = true,
				-- 	},
				-- 	["javascript"] = {
				-- 		enable_close = true,
				-- 	},
				-- 	["typescript"] = {
				-- 		enable_close = true,
				-- 	},
				-- 	["javascriptreact"] = {
				-- 		enable_close = true,
				-- 	},
				-- 	["typescriptreact"] = {
				-- 		enable_close = true,
				-- 	},
				-- },
			})
		end,
	},
}
