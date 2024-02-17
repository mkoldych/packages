local lsp = {}

function ccls_root_dir (cur_file)
    root_dir = vim.fs.dirname(
        vim.fs.find(
            {'.ccls'},
            { upward = true, path = vim.fs.dirname(cur_file) }
        )[1]
    )
    return root_dir
end

lsp.ccls_start = function ()
    vim.lsp.start({
        name = 'ccls',
        cmd = {'/usr/bin/ccls'},
        autostart = false,
        root_dir = ccls_root_dir(vim.api.nvim_buf_get_name(0)),
        init_options = {
            index = {
                threads = 0;
                multiVersion = 1;
            };
        },
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                  virtual_text = false,
                  signs = true,
                  update_in_insert = false,
                  underline = true,
                }
            )
        }
    })
end

lsp.setup = function ()
    -- Setup language servers.
    --local lspconfig = require('lspconfig')
    --lspconfig.pyright.setup {}

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Do not use the tags from the LSP
        vim.o.tagfunc=""
      end,
    })

    vim.cmd [[
        augroup ccls_start_aug
          autocmd!
          autocmd FileType c,cpp,h,hpp lua require('lsp').ccls_start()
        augroup END
    ]]
end

return lsp
