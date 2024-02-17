function! tools#loadCscope() abort
  try
    silent cscope add cscope.out
  catch /^Vim\%((\a\+)\)\=:E/
  endtry
endfunction


function! tools#JsoftRestoreLastPos()
    if &diff || bufname("") == "" || exists("b:did_JsoftRestoreLastPos") | return | endif
        let b:did_JsoftRestoreLastPos = 1
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
        if has("folding")
            " && foldlevel('.') != 0
            normal zv
        endif
endfunction


" Highlight lines that have characters > 80 columns {{{
function! tools#Line80Error()
    let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endfunction


" Shows function name (Mapped to f)
function! tools#ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search ("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction


function! tools#ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

