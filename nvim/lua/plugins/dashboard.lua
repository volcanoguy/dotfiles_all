-- ~/.config/nvim/lua/user/plugins/dashboard.lua
return {
	"nvimdev/dashboard-nvim",
	enabled = false,
	lazy = false, -- Ensure it loads immediately
	opts = function()
		local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║       
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{
						action = function()
							require("telescope.builtin").find_files()
						end,
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
					{
						action = function()
							require("telescope.builtin").oldfiles()
						end,
						desc = " Recent Files",
						icon = " ",
						key = "r",
					},
					{
						action = function()
							require("telescope.builtin").live_grep()
						end,
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = function()
							require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
						end,
						desc = " Config",
						icon = " ",
						key = "c",
					},
					{
						action = function()
							require("persisted").load()
						end,
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{ action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "%s"
		end

		return opts
	end,
}
