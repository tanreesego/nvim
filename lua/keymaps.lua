vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>vh", vim.lsp.buf.document_highlight)
vim.keymap.set("n", "<leader>vc", vim.lsp.buf.clear_references)
