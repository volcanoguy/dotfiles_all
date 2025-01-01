return {
	"supermaven-inc/supermaven-nvim",
	enabled = false,
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			ignore_filetypes = { txt = true },
			color = {
				suggestion_color = "#9BEC00",
				cterm = 244,
			},
		})
	end,
}
