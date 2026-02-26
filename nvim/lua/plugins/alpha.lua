return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                    ]],
			[[ ██████╗ ██╗   ██╗██████╗ ██╗   ██╗██████╗ ███████╗██╗   ██╗]],
			[[ ██╔══██╗██║   ██║██╔══██╗██║   ██║██╔══██╗██╔════╝██║   ██║]],
			[[ ██████╔╝██║   ██║██████╔╝██║   ██║██║  ██║█████╗  ██║   ██║]],
			[[ ██╔══██╗██║   ██║██╔══██╗██║   ██║██║  ██║██╔══╝  ╚██╗ ██╔╝]],
			[[ ██████╔╝╚██████╔╝██████╔╝╚██████╔╝██████╔╝███████╗ ╚████╔╝ ]],
			[[ ╚═════╝  ╚═════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝  ╚═══╝  ]],
			[[                                                    ]],
		}
		-- GREEN HEADER HIGHLIGHT
		vim.api.nvim_set_hl(0, "AlphaHeaderGreen", {
			fg = "#00ff87", -- bright green (terminal-friendly)
			bold = true,
		})

		dashboard.section.header.opts = {
			hl = "AlphaHeaderGreen",
			position = "center",
		}

		alpha.setup(dashboard.opts)
	end,
}
