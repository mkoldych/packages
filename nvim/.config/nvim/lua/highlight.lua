--local highlight = {}

highlight.setup = function ()
    vim.cmd [[
        highlight LspReferenceText ctermbg=darkyellow ctermfg=black
        highlight LspReferenceRead ctermbg=lightyellow ctermfg=black
        highlight LspReferenceWrite ctermbg=yellow ctermfg=black
        "augroup highlight_aug
        "    autocmd CursorHold  * lua vim.lsp.buf.document_highlight()
        "    autocmd CursorHoldI * lua vim.lsp.buf.document_highlight()
        "    autocmd CursorMoved * lua vim.lsp.buf.clear_references()
        "augroup END
    ]]
end

--return highlight
