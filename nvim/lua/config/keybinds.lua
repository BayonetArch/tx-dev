-- space asleader key

vim.g.mapleader = " "

local keymap = vim.keymap.set

-- remove highlighting
keymap("n", "<leader>hl", "<cmd>nohl<cr>", { desc = "remove highlighting" })

-- leader  bd  close current buffer
keymap("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

-- gq close bufferjovveride

keymap("n", "gq", ":bd!<CR>", { noremap = true, silent = true })

-- ctrl hjkl move focus between splits
keymap("n", "<M-w>h", "<cmd>wincmd h<cr>", { noremap = true })
keymap("n", "<M-w>w", "<C-w>w", { noremap = false })

keymap("n", "<M-w>j", "<cmd>wincmd j<cr>", { noremap = true })
keymap("n", "<M-w>k", "<cmd>wincmd k<cr>", { noremap = true })
keymap("n", "<M-w>l", "<cmd>wincmd l<cr>", { noremap = true })

-- keymaps for splits
keymap("n", "<leader>sv", "<C-w>v", { noremap = true, desc = "split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { noremap = true, desc = "split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { noremap = true, desc = "make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<cr>", { noremap = true, desc = "close the current split" })

-- keymaps for tabs
keymap("n", "<leader>tb", "<cmd>tabn<cr>", { desc = "move between tabs" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap("n", "<leader>tn", "<cmd>tabnew %<cr>", { desc = "one current window in new tab" })

-- ctrl shift j jump to next window
keymap("n", "<C-J>", "<C-w>w", { noremap = true })

-- ctrl e force quit all
keymap("n", "ge", ":qa!<CR>", { noremap = true })

-- ctrl c enter command mode
keymap({ "i", "v", "x", "n" }, "<C-c>", "<Esc>:")
keymap({ "i", "x", "n" }, "mc", "<Esc>:", { nowait = true })
keymap("v", "mc", ":", { noremap = true })
-- ctrl n go normal mode
keymap({ "i", "v", "x", "n" }, "<C-n>", "<Esc>")
keymap("i", "jj", "<Esc>", { noremap = true, expr = false, nowait = true })
--
-- ctrl s save file
keymap({ "n" }, "gs", "<Esc>:w<CR>")
-- keep selection after indenting
keymap("v", ">", ">gv", { noremap = true, silent = true })
keymap("v", "<", ">gv", { noremap = true, silent = true })
-- o O add new line below above without cursor move
keymap("n", "o", "m`o<Esc>``", { noremap = true })
keymap("n", "O", "m`O<Esc>``", { noremap = true })

-- tt copy using xclip
keymap("n", "tt", ":w !xclip -selection clipboard<CR>", { noremap = true, silent = true })

-- tp paste from xclip
keymap("n", "tp", ":r !xclip -selection clipboard -o<CR>", { noremap = true, silent = true })

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>cr", '"+y', { desc = "Copy to system clipboard" })

-- paste from system clipboard
vim.keymap.set("n", "<leader>pr", '"+p', { desc = "Paste from system clipboard" })

-- leader ll next buffer

keymap("n", "<leader>ll", ":bn<CR>", { noremap = true, desc = "next buffer" })

keymap("n", "<leader>hh", ":bp<CR>", { noremap = true, desc = "previous buffer" })

-- leader lf format using conform
keymap("n", "<leader>lf", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "format files " })

-- -------HARPOON bindings-----------

-- leader mh mark file with harpoon
keymap("n", "mf", function()
	require("harpoon.mark").add_file()
end, { desc = "Add files to harpoon list" })

-- leader ht toggle harpoon menu
keymap("n", "<leader>ht", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle harpoon menu" })

-- harpoon switch between harpoon files

keymap("n", "<leader>a", function()
	require("harpoon.ui").nav_file(1)
end, { noremap = true, nowait = true })

keymap("n", "<leader>w", function()
	require("harpoon.ui").nav_file(2)
end, { noremap = true, nowait = true })

keymap("n", "<leader>e", function()
	require("harpoon.ui").nav_file(3)
end, { noremap = true, nowait = true })

keymap("n", "<leader>r", function()
	require("harpoon.ui").nav_file(4)
end, { noremap = true, nowait = true })
-- wrap aware k j
keymap("n", "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { expr = true })

keymap("n", "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { expr = true })

-- leader gd jump to definition
keymap("n", "<leader>gd", "<C-]>", { noremap = true, desc = "jump to defination" })

-- leader dg jump back from definition
keymap("n", "<leader>dg", "<C-t>", { noremap = true, desc = "jump back from defination" })

-- paste from last yank

keymap("n", "<leader>p", '"0p', { desc = "Paste last yank" })

-- move lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- keep screen centered while moving

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- ctrl t toggle floating terminal
keymap({ "n", "t" }, "<A-t>", "<cmd>FloatingWin<CR>i", { desc = "Toggle floating window" })

-- toggle mark down renderer
keymap("n", "<leader>md", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle RenderMarkdown" })

--  set folding method to manual
keymap("n", "<leader>fm", "<cmd>set foldmethod=manual<cr> ", { noremap = true, desc = "set fold method to manual" })

-- toggle between conceal level. useful for markdown files
keymap("n", "<leader>cl", function()
	if vim.opt.conceallevel:get() == 0 then
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = ""
	else
		vim.opt.conceallevel = 0
	end
end, { desc = "Toggle Conceal Level" })

--temp bindings for broken keyboard
keymap({ "i", "c" }, "<C-b>", "\\")
keymap({ "i", "c" }, "<C-v>", "|")

local opts = { noremap = true, silent = true }

-- Alt + Enter to act as Enter
keymap("i", "<A-m>", "<CR>", opts)
keymap("c", "<A-m>", "<CR>", opts)
keymap("x", "<A-m>", "<CR>", opts)

keymap("i", "<A-h>", "<BS>", opts)
keymap("x", "<A-h>", "<BS>", opts)

keymap("i", "<A-w>", "<C-w>", opts)
keymap("x", "<A-w>", "<C-w>", opts)

keymap("i", "<A-i>", "<Tab>", opts)
keymap("n", "<A-c>", "<cmd>CodeCompanionChat<cr>", opts)
keymap("c", "<A-i>", "<Tab>", opts)

keymap("n", "<A-o>", "<C-o>", { noremap = true, silent = true })
keymap("n", "<A-i>", "<C-i>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>es", vim.diagnostic.open_float)

-- ctrl hjkl move focus between splits
keymap("n", "<M-w>h", "<cmd>wincmd h<cr>", { noremap = true })
keymap("n", "<M-w>j", "<cmd>wincmd j<cr>", { noremap = true })
keymap("n", "<M-w>k", "<cmd>wincmd k<cr>", { noremap = true })
keymap("n", "<M-w>l", "<cmd>wincmd l<cr>", { noremap = true })

-- leader ff format using conform
keymap("n", "<leader>ff", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "format files " })

-- telescope
local builtin = require("telescope.builtin")

keymap("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope oldfiles" })
keymap("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
keymap("n", "<leader>,", builtin.buffers, { desc = "Telescope buffers" })
keymap("n", "<leader>gs", builtin.grep_string, { desc = "Telescope grep_string" })
keymap("n", "<leader>mp", builtin.man_pages, { desc = "Telescope man_pages" })
keymap("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope diagnostics" })

-- for K
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover for lsp" })
keymap("n", "t", "p")
