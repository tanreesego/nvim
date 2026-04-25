-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp", -- pulls suggestions from the language server
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		cmp.setup({
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-y>"] = cmp.mapping.complete(), -- force open suggestions
-- 				["<Tab>"] = cmp.mapping.select_next_item(), -- Tab to go down
-- 				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab to go up
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
-- 			}),
-- 			sources = {
-- 				{ name = "nvim_lsp" }, -- use the language server as the source
-- 			},
-- 		})
-- 	end,
-- }
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = { -- When nvim-cmp wants to expand a snippet it calls this function and passes args.body which is the snippet text
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-y>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- shows snippet suggestions in the completion dropdown
			}, {
				{ name = "buffer" }, -- suggests words that already exist in your currently open buffers/files
			}),
		})
	end,
}
