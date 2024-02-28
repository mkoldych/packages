--[[
% git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
]]
require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself

    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make'  },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope.nvim",
      config = function()
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("fzf")
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
    },
    { "nvim-tree/nvim-web-devicons" },
    { "preservim/tagbar" },
}
