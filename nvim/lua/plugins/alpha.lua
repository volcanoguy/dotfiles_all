return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	enabled = false,
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Function to get current weekday and time
		local function get_weekday_and_time()
			local weekdays = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
			local current_weekday = os.date("%w") -- Get current weekday as number (0-6)
			local current_time = os.date("%H:%M") -- Format time as HH:MM
			return weekdays[tonumber(current_weekday) + 1], current_time
		end

		-- Get current weekday and time
		local weekday, time = get_weekday_and_time()

		-- Set header to display the current weekday and time
		dashboard.section.header.val = {
			string.format("Today is %s", weekday), -- Display current weekday
			string.format("Current Time: %s", time), -- Display current time
		}

		-- Initialize MRU section (optional)

		-- Set menu options
		dashboard.section.buttons.val = {
			dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("q", " Quit NVIM", ":qa<CR>"),
			{ type = "padding", val = 1 },
			{ type = "text", val = "Recent Files" },
		}

		-- Set footer (optional)
		dashboard.section.footer.val = "Welcome to Neovim!"

		-- Apply the configuration
		alpha.setup(dashboard.opts)
	end,
}
