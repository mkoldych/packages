function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

--[[ resize --]]
--[[
Map("n", "<Up>", ":resize -2<CR>")
Map("n", "<Down>", ":resize +2<CR>")
Map("n", "<Left>", ":vertical resize -2<CR>")
Map("n", "<Right>", ":vertical resize +2<CR>")
Map("t", "<Up>", "<cmd>resize -2<CR>")
Map("t", "<Down>", "<cmd>resize +2<CR>")
Map("t", "<Left>", "<cmd>vertical resize -2<CR>")
Map("t", "<Right>", "<cmd>vertical resize +2<CR>")
--]]

vim.cmd([[
" Tab navigation like Firefox.
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>
"
"nnoremap <C-Insert> :tabnew<CR>
"nnoremap <C-Delete> :tabclose<CR>
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
]])

vim.cmd([[
nnoremap <leader>w :call tools#ToggleQuickFix()<cr>
" quickfix navigation
nnoremap <leader>p :cp<cr>
nnoremap <leader>n :cn<cr>
]])

-- START TAGS MAPPINGS --
Map("n", "<C-]>", "g<C-]><CR>")
Map("n", "t[", ":tselect<Space>")
Map("n", "t]", ":tselect<CR>")
vim.cmd([[
"nnoremap <C-]> g<C-]><CR>
"nnoremap <C-'> :tselect<Space>
"nnoremap <C-;> :tselect<CR>
]])
-- END TAGS MAPPINGS --


-- START AUTOCOMPLETE MAPPINGS --
vim.cmd([[
" scroll autocomplete list with jk
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <C-f> ((pumvisible())?("\<C-n><C-n><C-n><C-n><C-n>"):("<C-f>"))
inoremap <expr> <C-b> ((pumvisible())?("\<C-p><C-p><C-p><C-p><C-p>"):("<C-b>"))

" Ctrl-Space for completions. Heck Yeah!
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"            \ "\<lt>C-n>" :
"            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

" Enter selects the item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Ctrl-space for omnicomp
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"  \ "\<lt>C-n>" :
"  \ "\<lt>C-x>\<lt>C-o>"
"imap <C-@> <C-Space>
]])
-- END AUTOCOMPLETE MAPPINGS --


-- START TELESCOPE MAPPINGS --
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

vim.keymap.set('n', '<leader>ff', builtin.resume, {})

vim.keymap.set('n', '<leader>fo', builtin.vim_options, {})
vim.keymap.set('n', "<leader>f'", builtin.marks, {})
vim.keymap.set('n', '<leader>f/', builtin.search_history, {})
vim.keymap.set('n', '<leader>f"', builtin.registers, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {})

vim.keymap.set('n', '<leader>faa', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fal', function() return telescope.extensions.live_grep_args.live_grep_args({search_dirs={string.gmatch(vim.fn.expand('%:~:.'), "%w+")()}}) end, {})

vim.keymap.set('n', '<leader>fg', function() return live_grep_args_shortcuts.grep_word_under_cursor({postfix=' -g ' .. string.gmatch(vim.fn.expand('%:~:.'), "%w+")() .. '/** -g !.ccls-cache -g !.git -g !.bzltojam -g !build_logs -g !ljam.log -g !cscope.files -g !tags '}) end, {})
vim.keymap.set('n', '<leader>fs', function() return builtin.grep_string({search_dirs={string.gmatch(vim.fn.expand('%:~:.'), "%w+")()}}) end, {})

vim.cmd([[
"nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
]])

-- END TELESCOPE MAPPINGS --


-- START LSP MAPPINGS --

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Buffer local mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local opts = { }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--vim.keymap.set('n', '<space>f', function()
--  vim.lsp.buf.format { async = true }
--end, opts)

-- END LSP MAPPINGS --

-- START HIGHLIGHT MAPPINGS --
vim.keymap.set('n', 'gt', vim.lsp.buf.document_highlight, opts)
vim.keymap.set('n', 'gc', vim.lsp.buf.clear_references, opts)
-- END HIGHLIGHT MAPPINGS --
