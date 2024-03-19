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

local plugins = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = 'make'  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
      --require("telescope").load_extension("fzf_native")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "preservim/tagbar" },

  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },

  -- Colorschemes
  { "folke/tokyonight.nvim" },
  { "lunarvim/darkplus.nvim" },

  -- Cmp 
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "neovim/nvim-lspconfig" },
}

require("lazy").setup(plugins)



