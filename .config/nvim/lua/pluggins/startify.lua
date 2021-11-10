vim.cmd [[let g:startify_custom_header = '']]
vim.cmd [[
let g:startify_lists = [ { 'type': 'dir', 'header': ['   MRU '. getcwd()] }, { 'type': 'files', 'header': ['   MRU'] }, { 'type': 'sessions', 'header': ['   Sessions'] }, { 'type': 'bookmarks', 'header': ['   Bookmarks'] }, { 'type': 'commands', 'header': ['   Commands'] }, ]
]]
