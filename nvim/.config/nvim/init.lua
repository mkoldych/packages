require('plugins')

function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

--local autocmds = {
--  startup = {
--    {"VimEnter",        "*",      [[lua vim.fn['tools#loadCscope']()]]};
--    {"VimEnter",        "*",      [[lua vim.fn['tools#JsoftRestoreLastPos']()]]};
--    {"BufWinEnter",     "*.[ch]", [[lua vim.fn['tools#Line80Error']()]]};
--  }
--}
--nvim_create_augroups(autocmds)

require('settings')    -- lua/settings.lua
require('maps')        -- lua/maps.lua
require('statusline')  -- lua/statusline.lua
require('colors')      -- lua/colors.lua
require('lsp').setup() -- lua/lsp.lua
require('ctrlp')
require('gutentags')
require('treesitter')

--require('whitespace').setup()
--require('nvimtree')
