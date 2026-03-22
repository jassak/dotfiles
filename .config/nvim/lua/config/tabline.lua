local M = {}

function M.render()
  local s = {}
  local current = vim.fn.tabpagenr()
  local last = vim.fn.tabpagenr("$")

  for i = 1, last do
    local hl = (i == current) and "%#TabLineSel#" or "%#TabLine#"
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local buf = buflist[winnr]

    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
    if name == "" then
      name = "[New]"
    end
    if vim.bo[buf].modified then
      name = "● " .. name
    end

    table.insert(s, hl)
    table.insert(s, "%" .. i .. "T")
    table.insert(s, " " .. i .. " " .. name .. " ")
  end

  table.insert(s, "%#TabLineFill#%T")
  return table.concat(s)
end

return M
