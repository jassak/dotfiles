local map = vim.keymap.set

vim.opt_local.colorcolumn = "121"

local function file_to_module(root, file)
  local rel = file:gsub("^" .. vim.pesc(root) .. "/", "")
  rel = rel:gsub("%.py$", "")
  return rel:gsub("/", ".")
end

local function open_term(cmd, cwd)
  vim.cmd("split")
  if cwd then
    vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
  end
  vim.cmd("term " .. cmd)
  vim.cmd("startinsert")
end

map("n", "<localleader>i", function()
  local file = vim.fn.expand("%:p")
  local root = vim.fs.root(0, { ".git", "pyproject.toml", "setup.py", "setup.cfg" })
  local mod = file_to_module(root, file)
  open_term("python -m IPython -i -m " .. mod, root)
end, { buffer = true, silent = true, desc = "IPython module" })

map("n", "<localleader>r", function()
  local file = vim.fn.expand("%:p")
  local root = vim.fs.root(0, { ".git", "pyproject.toml", "setup.py", "setup.cfg" })
  local mod = file_to_module(root, file)
  open_term("python -m " .. mod, root)
end, { buffer = true, silent = true, desc = "Run file in Python" })

map("n", "<localleader>db", "Obreakpoint()<Esc>^", { buffer = true, desc = "Insert breakpoint" })
map("n", "<localleader>plt", "Oimport matplotlib.pyplot as plt<Esc>^", { buffer = true, desc = "Insert pyplot import" })

map("n", "<localleader>p", function()
  vim.cmd("write")
  open_term("python -m cProfile --sort=cumtime " .. vim.fn.expand("%"), vim.fn.expand("%:p:h"))
end, { buffer = true, desc = "Profile file" })
