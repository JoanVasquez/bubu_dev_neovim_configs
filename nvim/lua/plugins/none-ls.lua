return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"eslint_d",
				"shfmt",
				"hadolint",
				"sqlfluff",
			},
			automatic_installation = true,
		})

		local sources = {
			-- Prettier with VS Code default options
			formatting.prettier.with({
				extra_args = {
					"--config-precedence=cli-override",
					"--single-quote=false",
					"--jsx-single-quote=false",
					"--tab-width=2",
					"--use-tabs=false",
					"--trailing-comma=all",
					"--semi=true",
					"--arrow-parens=always",
					"--print-width=100",
					"--end-of-line=lf",
				},
			}),
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),
		}
		if diagnostics.hadolint then
			table.insert(sources, diagnostics.hadolint)
		end
		if formatting.sqlfluff then
			table.insert(sources, formatting.sqlfluff)
		end
		if diagnostics.sqlfluff then
			table.insert(sources, diagnostics.sqlfluff)
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
