-- Emacs.nvim - Emacs keybindings for Neovim

local M = {}

-- Set up keybindings
function M.setup()
	-- Helper function for C-a
	local function home_action()
		local start_col = vim.fn.col(".")
		local indent_col = vim.fn.match(vim.fn.getline("."), "\\S") + 1

		if start_col == indent_col then
			return "<Home>"
		else
			return "<C-o>^"
		end
	end

	-- Helper function for C-k
	local function kill_line_action()
		return "<C-o>d$"
	end

	-- Insert mode mappings
	vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
	vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
	vim.keymap.set("i", "<C-a>", home_action, { noremap = true, expr = true })
	vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
	vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })
	vim.keymap.set("i", "<C-h>", "<BS>", { noremap = true })
	vim.keymap.set("i", "<C-k>", kill_line_action, { noremap = true, expr = true })

	-- Word movement in insert mode
	vim.keymap.set("i", "<M-f>", "<C-o>w", { noremap = true }) -- Forward word
	vim.keymap.set("i", "<M-b>", "<C-o>b", { noremap = true }) -- Backward word

	-- Word deletion in insert mode
	vim.keymap.set("i", "<M-d>", "<C-o>dw", { noremap = true }) -- Delete word forward
	vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true }) -- Delete word backward

	-- Move to indentation (first non-whitespace character)
	vim.keymap.set("i", "<M-m>", "<C-o>^", { noremap = true }) -- In insert mode

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

	-- Word movement in command mode
	vim.keymap.set("c", "<M-f>", "<S-Right>", { noremap = true }) -- Forward word
	vim.keymap.set("c", "<M-b>", "<S-Left>", { noremap = true }) -- Backward word

	-- Word deletion in command mode
	vim.keymap.set("c", "<M-d>", "<C-w>", { noremap = true }) -- Delete word forward
	vim.keymap.set("c", "<M-BS>", "<C-w>", { noremap = true }) -- Delete word backward
	vim.keymap.set("c", "<M-m>", "<Home><C-Right>", { noremap = true }) -- Move to indentation

	-- Command-T window configuration
	vim.g.CommandTCursorLeftMap = { "<Left>", "<C-b>" }
	vim.g.CommandTCursorRightMap = { "<Right>", "<C-f>" }
	vim.g.CommandTBackspaceMap = { "<BS>", "<C-h>" }
	vim.g.CommandTDeleteMap = { "<Del>", "<C-d>" }
end

return M
