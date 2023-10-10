require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 1000 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- Incremental selection based on the named nodes from the grammar.
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-s>",
      node_incremental = "<M-s>",
      -- scope_incremental = "grc",
      node_decremental = "<M-S>",
    },
  },

  -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
  -- indent = { enable = true },

  -- Treesitter text-objects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      -- selection_modes = {
      --   ['@parameter.outer'] = 'v', -- charwise
      --   ['@function.outer'] = 'V', -- linewise
      --   ['@class.outer'] = '<c-v>', -- blockwise
      -- },

      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["L"] = "@parameter.inner",
      },
      swap_previous = {
        ["H"] = "@parameter.inner",
      },
    },
  },

  -- treesitter-refactor
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
}


-- old config
-- require('nvim-treesitter.configs').setup {
--     highlight = {
--         enable = true -- false will disable the whole extension
--     },
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = '<M-s>',
    --         node_incremental = '<M-s>',
    --         scope_incremental = '<M-c>',  -- sCope
    --         node_decremental = '<M-S>'
    --     }
    -- },
    -- indent = {enable = false}, -- WIP feature doesn't work as expected
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    --         keymaps = {
    --             -- You can use the capture groups defined in textobjects.scm
    --             ['af'] = '@function.outer',
    --             ['if'] = '@function.inner',
    --             ['ac'] = '@class.outer',
    --             ['ic'] = '@class.inner'
    --         }
    --     },
    --     move = {
    --         enable = true,
    --         set_jumps = true, -- whether to set jumps in the jumplist
    --         goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
    --         goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
    --         goto_previous_start = {['[m'] = '@function.outer', ['[['] = '@class.outer'},
    --         goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer'}
    --     }
    -- },
    -- playground = {
    --     enable = true,
    --     disable = {},
    --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --     persist_queries = false, -- Whether the query persists across vim sessions
    --     keybindings = {
    --         toggle_query_editor = 'o',
    --         toggle_hl_groups = 'i',
    --         toggle_injected_languages = 't',
    --         toggle_anonymous_nodes = 'a',
    --         toggle_language_display = 'I',
    --         focus_language = 'f',
    --         unfocus_language = 'F',
    --         update = 'R',
    --         goto_node = '<cr>',
    --         show_help = '?'
    --     }
    -- }
-- }
