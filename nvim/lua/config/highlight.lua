-- Custom highlight for Winbar (filename  at the top of the window)
vim.api.nvim_set_hl(0, "WinBar", {
	fg = "#4fc3f7",
	bg = "#0a0a0a",
	bold = true,
})

vim.api.nvim_set_hl(0, "WinBarNC", {
	fg = "#5a5a5a",
	bg = "#0a0a0a",
})

-- for vertical and horizontal splits change line color
vim.cmd([[

  set fillchars+=vert:│
  highlight VertSplit guifg=#777777 guibg=NONE

  set fillchars+=horiz:─
  highlight WinSeparator guifg=#777777 guibg=NONE
]])
vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { bg = "#44475a", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#ffffff", bold = false })
