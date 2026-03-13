-- Python
local function git_root()
  local out = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")
  return out[1] and out[1] ~= "" and out[1] or nil
end

local function file_to_module(root, file)
  local rel = file:gsub("^" .. vim.pesc(root) .. "/", "")
  rel = rel:gsub("%.py$", "")
  return rel:gsub("/", ".")
end

vim.keymap.set("n", "<localleader>i", function()
  local file = vim.fn.expand("%:p")
  local root = git_root() or vim.fn.expand("%:p:h")
  local mod = file_to_module(root, file)

  vim.cmd("split")
  vim.cmd("lcd " .. vim.fn.fnameescape(root))

  -- Run module so relative imports work
  vim.cmd("term python -m IPython -i -m " .. mod)
  vim.cmd("startinsert")
end, { silent = true })

vim.cmd [[
augroup filetype_py
    autocmd!
    "autocmd FileType python set colorcolumn=89
    autocmd FileType python match Error /\%>120c/
    autocmd FileType python nnoremap <localleader>bb Obreakpoint()<esc>^
    autocmd FileType python nnoremap <localleader>bc Ofrom celery.contrib import rdb;rdb.set_trace()<esc>^
    autocmd FileType python nnoremap <localleader>bi O__import__("IPython").embed(colors="neutral")<esc>^
    autocmd FileType python nnoremap <localleader>plt Oimport matplotlib.pyplot as plt<esc>^
    "autocmd FileType python nnoremap <localleader>i :split term://ipython -i %<CR>i
    autocmd FileType python nnoremap <localleader>r :split term://python3 -i %<CR>i
    autocmd FileType python nnoremap <localleader>s :!isort % --profile black --force-single-line-imports<CR>
    autocmd FileType python nnoremap <buffer> <localleader>p :w<CR>:split term://python -m cProfile --sort=cumtime %<CR>
augroup END
]]
-- TODO below is not working
-- autocmd FileType python nnoremap <localleader>bc O__import__("celery.contrib.rdb").set_trace()<esc>^

-- Lua
vim.cmd [[
augroup filetype_lua
    autocmd!
    autocmd FileType lua nnoremap <localleader>i :split term://lua -i %<CR>i
augroup END
]]

-- Ledger keys
vim.cmd [[
augroup filetype_ledger
    autocmd!
    autocmd FileType ledger nnoremap <buffer> <localleader>a :Ledger bal Assets<CR>
    autocmd FileType ledger nnoremap <buffer> <localleader>u :Register Unknown<CR>
    autocmd FileType ledger nnoremap <buffer> <localleader>l :Ledger
    autocmd FileType ledger nnoremap <buffer> <localleader>r :Register
    autocmd FileType ledger nnoremap <buffer> <localleader>b :Ledger bal
    autocmd FileType ledger xnoremap <silent> <Tab> :LedgerAlign<CR>
    autocmd FileType ledger nnoremap <buffer> <C-c><C-c> :call ledger#entry()<CR>
augroup END
]]

-- Remember cursor position
vim.cmd [[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]

-- Haskell
vim.cmd [[
augroup filetype_hs
    autocmd!
    autocmd FileType haskell nnoremap <localleader>i :split term://ghci -i %<CR>i
augroup END
]]

-- Make esc work with fzf
-- https://github.com/junegunn/fzf.vim/issues/544#issuecomment-457456166
vim.cmd [[
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
]]

-- https://vi.stackexchange.com/questions/39200/wrapping-comment-in-visual-mode-not-working-with-gq
vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
     vim.bo[args.buf].formatexpr = nil
   end,
 })


-- Vimwiki https://mkaz.blog/working-with-vim/vimwiki
vim.cmd [[
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
]]

-- gnuplot
vim.cmd [[
augroup filetype_gnuplot
    autocmd!
    autocmd BufNewFile,BufRead *.gp   set filetype=gnuplot
augroup END
]]
