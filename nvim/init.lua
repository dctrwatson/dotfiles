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

vim.cmd[[packadd! dracula_pro]]
vim.g.dracula_colorterm = false
vim.cmd.colorscheme 'dracula_pro_van_helsing'

require("lazy").setup({
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = { theme = 'auto' },
	sections = {
          lualine_c = {
            {
              'filename',
              path = 4,
            }
          }
        }
      })
    end,
  },

  -- QoL
  { "axelf4/vim-strip-trailing-whitespace" },

  -- language plugins
  {
    "fatih/vim-go",
    config = function()
      vim.g['go_gopls_enabled'] = 0
      vim.g['go_code_completion_enabled'] = 0
      vim.g['go_def_mapping_enabled'] = 0
      vim.g['go_fmt_command'] = 'gofumpt'
      vim.g['go_imports_mode'] = 'goimports'
    end,
  },
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g['hcl_align'] = 1
      vim.g['terraform_alignt'] = 1
      vim.g['terraform_fmt_on_save'] = 1
    end,
  },

  -- tree-sitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'go',
          'gomod',
          'lua',
          'markdown',
          'markdown_inline',
          'mermaid',
          'ruby',
          'hcl',
          'vim',
          'vimdoc',
          'yaml',
        },
        indent = {
          enable = true,
          disable = {
          },
        },
        incremental_selection = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        highlight = {
          enable = true,

          -- Disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

      })
    end,
  },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.number = true        -- Show line numbers
vim.opt.showmatch = true     -- Highlight matching parenthesis
vim.opt.swapfile = false           -- Don't use swapfile
vim.opt.ignorecase = true          -- Search case insensitive...
vim.opt.smartcase = true           -- ... but not it begins with upper case

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

vim.opt.cursorline = true

vim.opt.list = true

vim.opt.scrolloff = 5

vim.opt.expandtab = true  -- expand tabs into spaces
vim.opt.shiftwidth = 2    -- number of spaces to use for each step of indent.
vim.opt.tabstop = 2       -- number of spaces a TAB counts for
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.wrap = true
