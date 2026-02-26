-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	lazy = false,
-- 	priority = 1000,
--
-- 	config = function()
-- 		local bg_transparent = true
--
-- 		local apply = function()
-- 			-- =============================
-- 			-- Devicons (languages & config)
-- 			-- =============================
-- 			require("nvim-web-devicons").setup({
-- 				default = true,
-- 				override = {
-- 					-- Programming languages
-- 					js = { icon = "", color = "#f1e05a", name = "Js" },
-- 					ts = { icon = "", color = "#3178c6", name = "Ts" },
-- 					jsx = { icon = "", color = "#61dafb", name = "Jsx" },
-- 					tsx = { icon = "", color = "#3178c6", name = "Tsx" },
-- 					py = { icon = "", color = "#3572A5", name = "Py" },
-- 					java = { icon = "", color = "#b07219", name = "Java" },
-- 					go = { icon = "", color = "#00ADD8", name = "Go" },
-- 					rs = { icon = "", color = "#dea584", name = "Rust" },
--
-- 					-- Config / tooling
-- 					json = { icon = "", color = "#cbcb41", name = "Json" },
-- 					yaml = { icon = "", color = "#6d8086", name = "Yaml" },
-- 					yml = { icon = "", color = "#6d8086", name = "Yml" },
-- 					toml = { icon = "", color = "#9c4221", name = "Toml" },
-- 					env = { icon = "", color = "#faf743", name = "Env" },
--
-- 					-- DevOps / infra
-- 					dockerfile = { icon = "", color = "#2496ED", name = "Dockerfile" },
-- 					sh = { icon = "", color = "#89e051", name = "Sh" },
-- 					tf = { icon = "󱁢", color = "#7B42BC", name = "Terraform" },
--
-- 					-- Docs
-- 					md = { icon = "", color = "#519aba", name = "Markdown" },
-- 				},
-- 			})
--
-- 			-- =============================
-- 			-- OneDarkPro setup
-- 			-- =============================
-- 			require("onedarkpro").setup({
-- 				options = {
-- 					transparency = bg_transparent,
-- 					terminal_colors = true,
-- 					highlight_inactive_windows = false,
-- 				},
--
-- 				styles = {
-- 					types = "NONE",
-- 					methods = "NONE",
-- 					numbers = "NONE",
-- 					strings = "NONE",
-- 					comments = "NONE",
-- 					keywords = "NONE",
-- 					constants = "NONE",
-- 					functions = "NONE",
-- 					operators = "NONE",
-- 					variables = "NONE",
-- 					parameters = "NONE",
-- 					conditionals = "NONE",
-- 					virtual_text = "NONE",
-- 				},
--
-- 				diagnostics = {
-- 					undercurl = true,
-- 					background = false,
-- 					darker = true,
-- 				},
--
-- 				highlights = {
-- 					NormalFloat = { bg = "none" },
-- 					FloatBorder = { bg = "none" },
-- 					Pmenu = { bg = "none" },
-- 				},
-- 			})
--
-- 			-- Apply colorscheme
-- 			vim.cmd.colorscheme("onedark")
--
-- 			-- GitSigns
-- 			vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#ffffff" })
-- 			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#98c379" })
-- 			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e5c07b" })
-- 			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#e06c75" })
--
-- 			-- Neo-tree Git
-- 			vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#ffffff" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#7f848e" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#e5c07b" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#98c379" })
--
-- 			-- Neo-tree icons
-- 			vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#61afef" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#e5c07b" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#e5c07b" })
-- 			vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#c678dd", bold = true })
-- 		end
--
-- 		apply()
--
-- 		vim.keymap.set("n", "<leader>bg", function()
-- 			bg_transparent = not bg_transparent
-- 			apply()
-- 		end, { noremap = true, silent = true, desc = "Toggle background transparency" })
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local bg_transparent = true

		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = bg_transparent,
			term_colors = true,

			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				telescope = true,
				neo_tree = true,
				which_key = true,
				cmp = true,
				gitsigns = true,
			},
		})

		-- Load colorscheme
		vim.cmd.colorscheme("catppuccin")

		-- Toggle background transparency
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			require("catppuccin").setup({
				transparent_background = bg_transparent,
			})
			vim.cmd.colorscheme("catppuccin")
		end

		vim.keymap.set(
			"n",
			"<leader>bg",
			toggle_transparency,
			{ noremap = true, silent = true, desc = "Toggle background transparency" }
		)
	end,
}
