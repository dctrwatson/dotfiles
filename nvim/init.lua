local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.cmd([[packadd! dracula_pro]])
vim.g.dracula_colorterm = false
vim.cmd.colorscheme("dracula_pro_van_helsing")

require("lazy").setup({
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "auto" },
				sections = {
					lualine_c = {
						{
							"filename",
							path = 4,
						},
					},
				},
			})
		end,
	},

	-- language plugins
	{
		"fatih/vim-go",
		config = function()
			vim.g["go_gopls_enabled"] = 0
			vim.g["go_code_completion_enabled"] = 0
			vim.g["go_def_mapping_enabled"] = 0
			vim.g["go_fmt_command"] = "gofumpt"
			vim.g["go_imports_mode"] = "goimports"
		end,
	},
	{
		"hashivim/vim-terraform",
		config = function()
			vim.g["hcl_align"] = 1
			vim.g["terraform_align"] = 1
			vim.g["terraform_fmt_on_save"] = 1
		end,
	},

	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"go",
				"gomod",
				"hcl",
				"json5",
				"jsonnet",
				"mermaid",
				"ruby",
				"yaml",
			})

			-- Needed because Neovim's shell filetype is usually "sh"
			vim.treesitter.language.register("bash", { "sh", "bash" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},

	-- formatter
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},

					hcl = {
						require("formatter.filetypes.terraform").terraformfmt,
					},

					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})

			local augroup_id = vim.api.nvim_create_augroup("Formatter", {})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				pattern = "*",
				command = "FormatWriteLock",
				group = augroup_id,
			})
		end,
	},
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.shada = "!,'100,<1000,s1024,h"
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.number = true -- Show line numbers
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.swapfile = false -- Don't use swapfile
vim.opt.ignorecase = true -- Search case insensitive...
vim.opt.smartcase = true -- ... but not it begins with upper case

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

vim.opt.cursorline = true

vim.opt.list = true

vim.opt.scrolloff = 5

vim.opt.expandtab = true -- expand tabs into spaces
vim.opt.shiftwidth = 2 -- number of spaces to use for each step of indent.
vim.opt.tabstop = 2 -- number of spaces a TAB counts for
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.wrap = true
