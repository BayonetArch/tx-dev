-- -- Set up auto commanda for usefuli stuffs-------
-- FIX comments
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- add some highlighting when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 180 })
	end,
})
-- setup color for yank highlighting
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FF4500" })

-- jump to the previous file position
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line([['"]])
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})

-- lsp attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf })
	end,
})
