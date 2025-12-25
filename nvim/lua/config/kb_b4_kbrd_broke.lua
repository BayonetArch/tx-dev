-- space as leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- remove highlighting
keymap("n", "<leader>hl", "<cmd>nohl<cr>", { desc = "remove highlighting" })

-- leader  bd  close current buffer
keymap("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

-- gq close buffer ovveride

keymap("n", "gq", ":bd!<CR>", { noremap = true, silent = true })

-- ctrl hjkl move focus between splits
keymap("n", "<C-h>", "<cmd>wincmd h<cr>", { noremap = true })
keymap("n", "<C-j>", "<cmd>wincmd j<cr>", { noremap = true })
keymap("n", "<C-k>", "<cmd>wincmd k<cr>", { noremap = true })
keymap("n", "<C-l>", "<cmd>wincmd l<cr>", { noremap = true })

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
vim.keymap.set({ "n", "v" }, "<leader>rc", '"+y', { desc = "Copy to system clipboard" })

-- paste fron system clipboard
vim.keymap.set("n", "<leader>rp", '"+p', { desc = "Paste from system clipboard" })

-- leader ll next buffer

keymap("n", "<leader>ll", ":bn<CR>", { noremap = true, desc = "next buffer" })

keymap("n", "<leader>hh", ":bp<CR>", { noremap = true, desc = "previous buffer" })

-- leader lf format using conform
keymap("n", "<leader>lf", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "format files " })

-- -------HARPOON bindings-----------

-- leader mh mark file with harpoon
keymap("n", "<C-m>", function()
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
keymap({ "n", "t" }, "<C-t>", "<cmd>FloatingWin<CR>i", { desc = "Toggle floating window" })

-- toggle mark down renderer
keymap("n", "<leader>md", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle RenderMarkdown" })

--  set folding method to manual
keymap("n", "<leader>fm", "<cmd>set foldmethod=manual<cr> ", { noremap = true, desc = "set fold method to manual" })

-- copilot accept

vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)")
vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")

-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)
-- toggle between conceal level
vim.keymap.set("n", "<leader>cl", function()
	if vim.opt.conceallevel:get() == 0 then
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = ""
	else
		vim.opt.conceallevel = 0
	end
end, { desc = "Toggle Conceal Level" })
--temp bindings for broken keyboard
keymap("i", "<C-b>", "\\")
keymap("i", "<C-v>", "|")
