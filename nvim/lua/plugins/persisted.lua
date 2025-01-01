-- ~/.config/nvim/lua/plugins/persisted.lua
return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("persisted").setup({
			autoload = true, -- Enable automatic loading of sessions
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Set the directory for session files
			use_git_branch = true, -- Enable git branch support for sessions
			on_autoload_no_session = function()
				vim.notify("No existing session to load.") -- Notify if no session is found
			end,
		})

		-- Key bindings for manual session management
		vim.api.nvim_set_keymap(
			"n",
			"<leader>qs",
			[[<cmd>lua require("persisted").load()<cr>]],
			{ noremap = true, silent = true, desc = "Restore Session" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>qS",
			[[<cmd>lua require("persisted").select()<cr>]],
			{ noremap = true, silent = true, desc = "Select Session" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ql",
			[[<cmd>lua require("persisted").load({ last = true })<cr>]],
			{ noremap = true, silent = true, desc = "Restore Last Session" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>qd",
			[[<cmd>lua require("persisted").stop()<cr>]],
			{ noremap = true, silent = true, desc = "Don't Save Current Session" }
		)
	end,
}
