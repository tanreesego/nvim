-- NEW CONFIG
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- LSP completion bridge
		"hrsh7th/cmp-nvim-lsp",

		-- snippets
		"saadparwaiz1/cmp_luasnip",

		-- extra completion sources
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP intelligence
				{ name = "luasnip" }, -- snippets
			}, {
				{ name = "buffer" }, -- words in file
				{ name = "path" }, -- file paths
			}),
		})
	end,
}
-- OLD CONFIG
-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"L3MON4D3/LuaSnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		cmp.setup({
-- 			snippet = { -- When nvim-cmp wants to expand a snippet it calls this function and passes args.body which is the snippet text
-- 				expand = function(args)
-- 					require("luasnip").lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-y>"] = cmp.mapping.complete(),
-- 				["<Tab>"] = cmp.mapping.select_next_item(),
-- 				["<S-Tab>"] = cmp.mapping.select_prev_item(),
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 			}),
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- shows snippet suggestions in the completion dropdown
-- 			}, {
-- 				{ name = "buffer" }, -- suggests words that already exist in your currently open buffers/files
-- 				{ name = "path" },
-- 			}),
-- 		})
-- 	end,
-- }
