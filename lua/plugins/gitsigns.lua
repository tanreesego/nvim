-- in your plugins folder, new file: gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Navigation between hunks
				vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
				vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })

				-- Stage / unstage
				vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
				vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Unstage hunk" })
				vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage entire file" })

				-- Revert / reset
				vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Revert hunk" })
				vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr, desc = "Revert entire file" })

				-- Preview the diff of a hunk inline
				vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk diff" })

				-- Blame
				vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Blame current line" })
				vim.keymap.set(
					"n",
					"<leader>hB",
					gs.toggle_current_line_blame,
					{ buffer = bufnr, desc = "Toggle inline blame" }
				)

				-- Diff view
				vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff this file" })
			end,
		})
	end,
}
