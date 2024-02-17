local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

    use "nvim-lua/plenary.nvim"

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
      requires = { 
          {'nvim-lua/plenary.nvim'},
        { "nvim-telescope/telescope-live-grep-args.nvim" },
      },
      config = function()
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("fzf")
      end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {'nvim-tree/nvim-web-devicons'}
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        
        theme = 'hyper',--  theme is doom and hyper default is hyper
        disable_move,    --  default is false disable move keymap for hyper
        shortcut_type,   --  shorcut type 'letter' or 'number'
        change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
        config = {},    --  config used for theme
        hide = {
          statusline,    -- hide statusline default is true
          tabline,       -- hide the tabline
          winbar,        -- hide winbar
        },
        preview = {
          command,       -- preview command
          file_path,     -- preview file path
          file_height,   -- preview file height
          file_width,    -- preview file width
        },
        
        config = {
            header, -- type is table def
            week_header = {
                enable,  --boolean use a week header
                concat,  --concat string after time string line
                append,  --table append after time string line
            },
            disable_move,  -- boolean default is false disable move key
        },

        --[[ When using hyper ]]--
      shortcut = {
        -- action can be a function type
        { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
      },
      packages = { enable = true }, -- show how many plugins neovim loaded
      -- limit how many projects list, action when you press key or enter it will run this action.
      -- action can be a functino type, e.g.
      -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
      project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
      mru = { limit = 10, icon = 'your icon', label = '', },
      footer = {}, -- footer
        --[[ ================ ]]--
        requires = {'nvim-tree/nvim-web-devicons'}
    }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

