return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>C", nil, desc = "AI/Claude Code" },
    { "<leader>Cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>Cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>Cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>CC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>Cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>Cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>Cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>Ct",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>Ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>Cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
  opts = {
    -- Server Configuration
    port_range = { min = 10000, max = 65535 },
    auto_start = true,
    log_level = "info", -- "trace", "debug", "info", "warn", "error"
    terminal_cmd = nil, -- Custom terminal command (default: "claude")
                        -- For local installations: "~/.claude/local/claude"
                        -- For native binary: use output from 'which claude'

    -- Send/Focus Behavior
    -- When true, successful sends will focus the Claude terminal if already connected
    focus_after_send = false,

    -- Selection Tracking
    track_selection = true,
    visual_demotion_delay_ms = 50,

    -- Terminal Configuration
    terminal = {
      split_side = "right", -- "left" or "right"
      split_width_percentage = 0.50,
      provider = "auto", -- "auto", "snacks", "native", "external", "none", or custom provider table
      auto_close = true,
      snacks_win_opts = {}, -- Opts to pass to `Snacks.terminal.open()` - see Floating Window section below

      -- Provider-specific options
      provider_opts = {
        -- Command for external terminal provider. Can be:
        -- 1. String with %s placeholder: "alacritty -e %s" (backward compatible)
        -- 2. String with two %s placeholders: "alacritty --working-directory %s -e %s" (cwd, command)
        -- 3. Function returning command: function(cmd, env) return "alacritty -e " .. cmd end
        external_terminal_cmd = nil,
      },
    },

    -- Diff Integration
    diff_opts = {
      layout = "vertical", -- "vertical" or "horizontal"
      open_in_new_tab = true,
      keep_terminal_focus = true, -- If true, moves focus back to terminal after diff opens
      hide_terminal_in_new_tab = true,
      -- on_new_file_reject = "keep_empty", -- "keep_empty" or "close_window"

      -- Legacy aliases (still supported):
      -- vertical_split = true,
      -- open_in_current_tab = true,
    },
  },
}
