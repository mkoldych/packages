local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo

HOME = os.getenv("HOME")

o.scrolloff = 5 -- keep at least 5 line visible above/below cursor
o.ruler = true -- show the cursor position all the time
o.rulerformat = '%l:%c%V'

--o.t_Co = '256'
--o.term = 'xterm-256color'
o.backupdir = HOME .. '/vim/backup'
o.directory = HOME .. '/vim/tmp'
o.switchbuf = 'vsplit'

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

o.backspace = 'indent,eol,start' --How backspace behaves
o.selectmode = 'mouse' --How selection behaves while selecting with a mouse
o.mousemodel='extend' -- Pressing <RightMouse> extends selection instead of showing popup-menu: >vim
o.modeline = true
o.showcmd = true --Display what is currently typed in the bottom right hand corner
o.showmatch = true --highlight matching parenthesis.
o.mouse = 'a'
--o.ttymouse = 'xterm2'

--o.errorfile = 'ljam.err'
--o.makeprg = 'cv'

--[[ START AUTOCOMPLETE ]]--
o.completeopt = 'menu,menuone,longest'
--o.completeopt = {'menu', 'menuone', 'noselect'}
o.complete = '.,w,b,u,t'
vim.cmd([[
set shortmess+=c " do not display redundant info in the status bar when menu pops up
]])
--[[ END AUTOCOMPLETE ]]--

o.clipboard = 'unnamedplus'   -- use system clipboard 

-- Tab
o.tabstop = 4                 -- number of visual spaces per TAB
o.softtabstop = 4             -- number of spacesin tab when editing
o.shiftwidth = 4              -- insert 4 spaces on a tab
o.expandtab = true            -- tabs are spaces, mainly because of python
o.smarttab = true     --Will delete and insert shiftwidth, rather than one space
o.autoindent = true   --Copies indent from the current line to the next line

-- UI config
--o.number = true               -- show absolute number
--o.relativenumber = true       -- add numbers to each line on the left side
o.cursorline = true           -- highlight cursor line underneath the cursor horizontally
o.splitbelow = true           -- open new vertical split bottom
o.splitright = true           -- open new horizontal splits right
-- o.termguicolors = true        -- enabl 24-bit RGB color in the TUI
o.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
o.incsearch = true            -- search as characters are entered
o.hlsearch = true             --highlight keywords being matched from search.
o.ignorecase = true           -- ignore case in searches by default
o.smartcase = true            -- but make it case sensitive if an uppercase is entered
o.tagcase = "match"

o.path = "include," .. o.path -- use "gf" to go to fine under cursor

-- NetRW
g.netrw_liststyle = 3

-- Error Highlighting
--vim.cmd([[
--match errorMsg /\s\+$/
--]])
