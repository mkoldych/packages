vim.cmd([[
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*/obj-*/*

"
"When starting up, CtrlP sets its local working directory according to this
"variable:
"  let g:ctrlp_working_path_mode = 'ra'
"  c - the directory of the current file.
"  a - like "c", but only applies when the current working directory outside of
"      CtrlP isn't a direct ancestor of the directory of the current file.
"  r - the nearest ancestor that contains one of these directories or files:
"      .git .hg .svn .bzr _darcs
"  w - begin finding a root from the current working directory outside of CtrlP
"      instead of from the directory of the current file (default). Only applies
"      when "r" is also present.
"  0 or <empty> - disable this feature.
let g:ctrlp_working_path_mode = '0'

"let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_user_command = 'cat %s/cscope.files'
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_user_command = 'cd %s; git ls-files -oc --exclude-standard'
let g:ctrlp_user_command = 'cd %s; cat cscope.files'

"Set this to 1 to set searching by filename (as opposed to full path) as the
"default: >
let g:ctrlp_by_filename = 1
"<
"Can be toggled on/off by pressing <c-d> inside the prompt.

"When opening a file, if it's already open in a window somewhere, CtrlP will try
"to jump to it instead of opening a new instance: >
  let g:ctrlp_switch_buffer = 'Et'
"<
"  e - jump when <cr> is pressed, but only to windows in the current tab.
"  t - jump when <c-t> is pressed, but only to windows in another tab.
"  v - like "e", but jump when <c-v> is pressed.
"  h - like "e", but jump when <c-x> is pressed.
"  E, T, V, H - like "e", "t", "v", and "h", but jump to windows anywhere.
"  0 or <empty> - disable this feature.

"show lots of files
let g:ctrlp_match_window = 'min:5,max:99999'
]])
