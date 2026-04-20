local test_term = nil

local function get_pytest_node_id()
  local file = vim.fn.expand("%:p")
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local current_class = nil
  local current_function = nil

  for i = 1, row do
    local line = lines[i]

    -- Match class definition
    local class_name = line:match("^class%s+([%w_]+)")
    if class_name then
      current_class = class_name
      current_function = nil -- reset function when entering a new class
    end

    -- Match test function/method
    local indent, func_name = line:match("^(%s*)def%s+(test_[%w_]+)")
    if func_name then
      current_function = func_name
      -- Top-level function (no indent or no class context)
      if indent == "" then
        current_class = nil
      end
    end
  end

  if not current_function then
    return nil
  end

  if current_class then
    return file .. "::" .. current_class .. "::" .. current_function
  else
    return file .. "::" .. current_function
  end
end

local function run_current_test_in_terminal()
  local test_id = get_pytest_node_id()

  if not test_id then
    vim.notify("No test found at cursor", vim.log.levels.WARN)
    return
  end

  local cmd = "pytest -s " .. vim.fn.shellescape(test_id)

  if test_term then
    test_term:shutdown()
  end

  test_term = require("toggleterm.terminal").Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false,
    on_open = function()
      vim.cmd("startinsert!")
    end,
  })
  test_term:toggle()
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    keys = {
      {
        "<localleader>tt",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
        ft = "python",
      },
      {
        "<localleader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run file tests",
        ft = "python",
      },
      {
        "<localleader>ta",
        function()
          require("neotest").run.run({ suite = true })
        end,
        desc = "Run test suite",
        ft = "python",
      },
      {
        "<localleader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
        ft = "python",
      },
      {
        "<localleader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Test output",
        ft = "python",
      },
      {
        "<localleader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test summary",
        ft = "python",
      },
      {
        "<localleader>td",
        run_current_test_in_terminal,
        desc = "Test debug (pytest -s)",
        ft = "python",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            runner = "pytest",
          }),
        },
      })
    end,
  },
}
