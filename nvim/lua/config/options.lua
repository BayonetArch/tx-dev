-- faster updates
vim.opt.updatetime = 100

vim.opt.winborder = "rounded"

-- keybinds reg time
vim.opt.timeout = true
vim.opt.timeoutlen = 450

-- enable true color
vim.opt.termguicolors = true

-- Disable swap
vim.opt.swapfile = false

-- show cursorlineline
vim.o.cursorline = true

-- smoother horizontal scrolling
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 8

-- search stuff
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- auto reload files when changed
vim.opt.autoread = true
vim.bo.autoread = true

-- case insensitive unless capital used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- treesitter based folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- hide ~ chars on empty lines
vim.opt.fillchars = { eob = " " }

-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- always show sign column
vim.opt.signcolumn = "yes:1"

-- show file name on top bar
vim.opt.winbar = "%t"
-- conceal level
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
-- lightline statusline setup
vim.cmd([[
  let g:lightline = {
        \ 'colorscheme': 'nightfly',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
        \   'right': [ [ 'filetype' ] ]
        \ },
        \ 'component': {
        \   'lineinfo': '%3l:%-2v'
        \ }
        \ }
]])
-- Lua initialization file
vim.g.nightflyCursorColor = true
-- Lua initialization file
vim.g.nightflyTransparent = true
-- split settings
vim.opt.splitbelow = true

-- basic editor settings
vim.cmd([[
se tabstop=2
se shiftwidth=2
se expandtab
se smartindent
se autoindent
se nu
se relativenumber
" escape from terminal mode
tnoremap <Esc> <C-\><C-n>
]])

vim.diagnostic.config({
	virtual_text = {
		current_line = true,
	},
	-- virtual_text = true,
	signs = false,
	underline = true,
	update_in_insert = false,
})


