language en_US.UTF-8

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

source ~/.config/vim/settings.vim
source ~/.config/vim/keymaps.vim
source ~/.config/vim/plugininstall.vim
source ~/.config/vim/pluginconfig.vim
source ~/.config/vim/autocommands.vim
source ~/.config/vim/pluginkeymaps.vim
source ~/.config/vim/leaderkeymaps.vim
source ~/.config/vim/functions.vim

highlight Comment cterm=italic gui=italic
highlight String cterm=italic
" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" highlight link pythonDocstring comment
