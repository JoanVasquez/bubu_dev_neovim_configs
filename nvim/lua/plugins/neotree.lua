return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					default = "󰈙",
					highlight = "NeoTreeFileIcon",
				},

				git_status = {
					symbols = {
						added = "",
						modified = "󰏫",
						deleted = "",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},

				diagnostics = {
					symbols = {
						hint = "󰌶",
						info = "󰋽",
						warn = "󰀪",
						error = "󰅚",
					},
				},
			},
		},
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},

	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					bo = {
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			})

			vim.keymap.set(
				"n",
				"<leader>e",
				":Neotree toggle position=left<CR>",
				{ noremap = true, silent = true, desc = "Explorer (Neo-tree)" }
			)
		end,
	},
}
