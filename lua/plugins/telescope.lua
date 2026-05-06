return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		-- File navigation
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
		vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>")
		vim.keymap.set("n", "<leader>ps", "<cmd>Telescope grep_string<cr>")
		vim.keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>")

		-- Git
		vim.keymap.set("n", "<leader>gc", builtin.git_commits) -- browse all commits, preview diff, checkout
		vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits) -- commits for current buffer only
		vim.keymap.set("n", "<leader>gb", builtin.git_branches) -- list branches, checkout or diff
		vim.keymap.set("n", "<leader>gs", builtin.git_status) -- changed files, stage with <tab>
		vim.keymap.set("n", "<leader>gst", builtin.git_stash) -- list stashes, apply on <cr>

		-- LSP / Symbols
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>") -- symbols in current file
		vim.keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>") -- symbols across project
		vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>") -- current buffer
		vim.keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics<cr>") -- all files
	end,
}
