local o = vim.o
local wo = vim.wo
local bo = vim.bo

HOME = os.getenv("HOME")

o.scrolloff = 5 -- keep at least 5 line visible above/below cursor
o.ruler = true -- show the cursor position all the time
o.rulerformat = '%l:%c%V'

--o.t_Co = '256'
--o.term = 'xterm-256color'
o.backupdir = '~/.vimbackup'
o.directory = '/tmpi'
o.switchbuf = 'vsplit'

o.tabstop = 4    --Tells vim the number of columns a tab should be counted as
o.expandtab = true    --A tab in insert mode is converted to spaces.
-- Have a backup file created - file_name~ will be created, which is a capture
-- of the file prior to the current edit.
o.backup = true
o.writebackup = true --make a backup before overwriting a file.
o.laststatus = 2 --Always display last status at bottom of window.
o.ruler = true   --Helpful display in the bottom right hand corner.
o.cmdheight = 1 --When entering command mode, two rows will be displayed.
o.history = 50 --Keep 50 lines of history.
o.wildmode = 'longest,list,full' --Similar to bash autocomplete.
o.wildmenu = true
o.cindent = true
o.background = 'dark'

o.shiftwidth = 4 --Tells vim the number of columns a shiftwidth should be counted as
o.smarttab = true     --Will delete and insert shiftwidth, rather than one space
o.autoindent = true   --Copies indent from the current line to the next line
o.hlsearch = true   --highlight keywords being matched from search.
o.incsearch = true  --When you beging typing a a word to search, vi(m) will begin
                --matchig incrementally rather than waiting until completion.
o.backspace = 'indent,eol,start' --How backspace behaves
o.selectmode = 'mouse' --How selection behaves while selecting with a mouse
o.mousemodel='extend' -- Pressing <RightMouse> extends selection instead of showing popup-menu: >vim
o.modeline = true
o.showcmd = true --Display what is currently typed in the bottom right hand corner
o.showmatch = true --highlight matching parenthesis.
o.cursorline = true   --See that beautiful line currently highlighting where your cursor is
o.mouse = 'a'
--o.ttymouse = 'xterm2'

o.errorfile = 'ljam.err'
o.makeprg = 'cv'

--[[ START AUTOCOMPLETE ]]--
o.completeopt = 'menu,menuone,longest'
o.complete = '.,w,b,u,t'
vim.cmd([[
set shortmess+=c " do not display redundant info in the status bar when menu pops up
]])
--[[ END AUTOCOMPLETE ]]--
