-- Emacs.nvim - Emacs keybindings for Neovim
-- Save this as lua/emacs.lua

local M = {}

-- Helper function to replace the home() function
local function home()
	local start_col = vim.fn.col(".")
	vim.cmd("normal! ^")
	if vim.fn.col(".") == start_col then
		vim.cmd("normal! 0")
	end
	return ""
end

-- Helper function to split line text at cursor
local function split_line_text_at_cursor()
	local line_text = vim.fn.getline(".")
	local col = vim.fn.col(".")
	local text_after_cursor = string.sub(line_text, col)
	local text_before_cursor = col > 1 and string.sub(line_text, 1, col - 1) or ""
	return text_before_cursor, text_after_cursor
end

-- Helper function to replace the kill_line() function
local function kill_line()
	local text_before_cursor, text_after_cursor = split_line_text_at_cursor()
	if #text_after_cursor == 0 then
		vim.cmd("normal! J")
	else
		vim.fn.setline(".", text_before_cursor)
	end
	return ""
end

-- Set up keybindings
function M.setup()
	-- Insert mode mappings
	vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
	vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
	vim.keymap.set("i", "<C-a>", function()
		return home()
	end, { noremap = true, expr = true })
	vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
	vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })
	vim.keymap.set("i", "<C-h>", "<BS>", { noremap = true })
	vim.keymap.set("i", "<C-k>", function()
		return kill_line()
	end, { noremap = true, expr = true })

	-- Command line mode mappings
	vim.keymap.set("c", "<C-p>", "<Up>", { noremap = true })
	vim.keymap.set("c", "<C-n>", "<Down>", { noremap = true })
	vim.keymap.set("c", "<C-b>", "<Left>", { noremap = true })
	vim.keymap.set("c", "<C-f>", "<Right>", { noremap = true })
	vim.keymap.set("c", "<C-a>", "<Home>", { noremap = true })
	vim.keymap.set("c", "<C-e>", "<End>", { noremap = true })
	vim.keymap.set("c", "<C-d>", "<Del>", { noremap = true })
	vim.keymap.set("c", "<C-h>", "<BS>", { noremap = true })
	vim.keymap.set("c", "<C-k>", "<C-f>D<C-c><C-c>:<Up>", { noremap = true })

	-- Command-T window configuration
	-- Note: This assumes you're using the Command-T plugin
	vim.g.CommandTCursorLeftMap = { "<Left>", "<C-b>" }
	vim.g.CommandTCursorRightMap = { "<Right>", "<C-f>" }
	vim.g.CommandTBackspaceMap = { "<BS>", "<C-h>" }
	vim.g.CommandTDeleteMap = { "<Del>", "<C-d>" }
end

return M
