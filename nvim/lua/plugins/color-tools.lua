return {
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				-- You can list filetypes, or use "*" for all
				"*",
			}, {
				-- Better defaults
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Blue", "red" (I usually keep this off)
				RRGGBBAA = true, -- #RRGGBBAA
				rgb_fn = true, -- rgb(255, 0, 0)
				hsl_fn = true, -- hsl(150, 100%, 50%)
				css = true,
				css_fn = true,

				-- Display mode:
				-- "background" is very readable; "foreground" is subtle; "virtualtext" is minimal.
				mode = "background",

				-- Enable Tailwind colors if you want (optional)
				-- tailwind = true,

				-- More performance-friendly; set to 0 to disable.
				-- (not available in all versions)
				-- always_update = false,
			})

			-- Optional: enable by default for current buffer when opening
			-- vim.cmd("ColorizerAttachToBuffer")
		end,
		keys = {
			{ "<leader>uC", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
		},
	},
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		config = function()
			local ccc = require("ccc")

			ccc.setup({
				-- If you want it to play nicely with existing highlights:
				highlighter = {
					auto_enable = false, -- we rely on colorizer for passive highlighting
				},

				-- Nice set of color formats (you can tweak)
				convert = {
					{ ccc.picker.hex, ccc.output.hex },
					{ ccc.picker.hex, ccc.output.hex_short },
					{ ccc.picker.css_rgb, ccc.output.css_rgb },
					{ ccc.picker.css_hsl, ccc.output.css_hsl },
				},

				-- UI feel
				win_opts = {
					border = "rounded",
				},
			})
		end,
		keys = {
			{ "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Pick (CCC)" },
			{ "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert Color (CCC)" },
			{ "<leader>ct", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle CCC Highlighter" },
		},
	},
}
