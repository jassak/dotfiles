local M = {}

local ai_dir = vim.fn.expand("~/ai")
local index_file = ai_dir .. "/index.md"

local MONTH_NAMES = {
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
}

local function ensure_dir(path)
  vim.fn.mkdir(path, "p")
end

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function file_exists(path)
  return vim.fn.filereadable(path) == 1
end

local function read_lines(path)
  if not file_exists(path) then
    return {}
  end
  return vim.fn.readfile(path)
end

local function write_lines(path, lines)
  vim.fn.writefile(lines, path)
end

local function basename(path)
  return vim.fn.fnamemodify(path, ":t")
end

local function date_from_filename(name)
  local y, m, d = name:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)")
  if y and m and d then
    return string.format("%s-%s-%s", y, m, d)
  end

  local full_path = ai_dir .. "/" .. name
  return os.date("%Y-%m-%d", vim.fn.getftime(full_path))
end

local function parse_ymd(date_str)
  local y, m, d = date_str:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
  if not y then
    return nil
  end
  return {
    year = tonumber(y),
    month = tonumber(m),
    day = tonumber(d),
  }
end

local function ymd_to_time(date_str)
  local p = parse_ymd(date_str)
  if not p then
    return nil
  end

  return os.time({
    year = p.year,
    month = p.month,
    day = p.day,
    hour = 0,
    min = 0,
    sec = 0,
  })
end

local function topic_from_filename(name)
  local s = name:gsub("%.md$", "")
  s = s:gsub("^%d%d%d%d%-%d%d%-%d%d[._-]?", "")
  s = s:gsub("[._-]+", " ")
  s = trim(s)

  if s == "" then
    return "Untitled"
  end

  return s
end

local function topic_from_file(path)
  local lines = read_lines(path)

  for _, line in ipairs(lines) do
    local you = line:match("^# topic:%s*(.+)$")
    if you and trim(you) ~= "" then
      local text = trim(you)
      if #text > 90 then
        text = text:sub(1, 90) .. "..."
      end
      return text
    end
  end

  for _, line in ipairs(lines) do
    local heading = line:match("^#%s+(.+)$")
    if heading and trim(heading) ~= "" then
      return trim(heading)
    end
  end

  for _, line in ipairs(lines) do
    local text = trim(line)
    if text ~= "" then
      text = text:gsub("^#+%s*", "")
      if #text > 90 then
        text = text:sub(1, 90) .. "..."
      end
      return text
    end
  end

  return topic_from_filename(basename(path))
end

local function collect_entries()
  ensure_dir(ai_dir)

  local files = vim.fn.globpath(ai_dir, "*.md", false, true)
  local entries = {}

  for _, path in ipairs(files) do
    local name = basename(path)
    if name ~= "index.md" then
      table.insert(entries, {
        name = name,
        date = date_from_filename(name),
        topic = topic_from_file(path),
      })
    end
  end

  table.sort(entries, function(a, b)
    if a.date == b.date then
      return a.name > b.name
    end
    return a.date > b.date
  end)

  return entries
end

local function build_sections(entries)
  local now = os.time()
  local today = os.date("*t", now)
  local today_start = os.time({
    year = today.year,
    month = today.month,
    day = today.day,
    hour = 0,
    min = 0,
    sec = 0,
  })

  local previous_7_days_threshold = today_start - (7 * 24 * 60 * 60)
  local previous_30_days_threshold = today_start - (30 * 24 * 60 * 60)

  local sections = {
    today = {},
    previous_7_days = {},
    previous_30_days = {},
    years = {},
  }

  for _, entry in ipairs(entries) do
    local ts = ymd_to_time(entry.date)

    if ts then
      if ts >= today_start then
        table.insert(sections.today, entry)
      elseif ts >= previous_7_days_threshold then
        table.insert(sections.previous_7_days, entry)
      elseif ts >= previous_30_days_threshold then
        table.insert(sections.previous_30_days, entry)
      else
        local p = parse_ymd(entry.date)
        if p then
          sections.years[p.year] = sections.years[p.year] or {}
          sections.years[p.year][p.month] = sections.years[p.year][p.month] or {}
          table.insert(sections.years[p.year][p.month], entry)
        end
      end
    end
  end

  return sections
end

local function append_entry_lines(out, entries)
  for _, entry in ipairs(entries) do
    table.insert(out, string.format("[%s | %s](./%s)", entry.date, entry.topic, entry.name))
  end
  table.insert(out, "")
end

local function sorted_years(year_map)
  local years = {}
  for year, _ in pairs(year_map) do
    table.insert(years, year)
  end
  table.sort(years, function(a, b)
    return a > b
  end)
  return years
end

local function sorted_months(month_map)
  local months = {}
  for month, _ in pairs(month_map) do
    table.insert(months, month)
  end
  table.sort(months, function(a, b)
    return a > b
  end)
  return months
end

local function format_index(entries)
  local sections = build_sections(entries)

  local out = {
    "# AI Chats",
    "",
    string.format("*Updated: %s*", os.date("%Y-%m-%d %H:%M")),
    "",
  }

  local has_entries = false

  if #sections.today > 0 then
    has_entries = true
    table.insert(out, "## Today")
    table.insert(out, "")
    append_entry_lines(out, sections.today)
  end

  if #sections.previous_7_days > 0 then
    has_entries = true
    table.insert(out, "## Previous 7 Days")
    table.insert(out, "")
    append_entry_lines(out, sections.previous_7_days)
  end

  if #sections.previous_30_days > 0 then
    has_entries = true
    table.insert(out, "## Previous 30 Days")
    table.insert(out, "")
    append_entry_lines(out, sections.previous_30_days)
  end

  for _, year in ipairs(sorted_years(sections.years)) do
    has_entries = true
    table.insert(out, "## " .. tostring(year))
    table.insert(out, "")

    for _, month in ipairs(sorted_months(sections.years[year])) do
      table.insert(out, "### " .. MONTH_NAMES[month])
      table.insert(out, "")
      append_entry_lines(out, sections.years[year][month])
    end
  end

  if not has_entries then
    table.insert(out, "No chats yet.")
  end

  return out
end

function M.rebuild()
  ensure_dir(ai_dir)
  local entries = collect_entries()
  local out = format_index(entries)
  write_lines(index_file, out)
end

function M.open_index()
  ensure_dir(ai_dir)
  if not file_exists(index_file) then
    M.rebuild()
  end
  vim.cmd("edit " .. vim.fn.fnameescape(index_file))
end

function M.setup_autocmds()
  local group = vim.api.nvim_create_augroup("ParrotAiIndex", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    callback = function(args)
      local file = args.file
      local prefix = ai_dir .. "/"

      if file:sub(1, #prefix) ~= prefix then
        return
      end

      if vim.fn.fnamemodify(file, ":t") == "index.md" then
        return
      end

      M.rebuild()
    end,
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    callback = function()
      M.rebuild()
    end,
  })
end

return M
