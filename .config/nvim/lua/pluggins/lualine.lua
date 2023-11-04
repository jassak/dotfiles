-- bubbles theme https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = '|',                                           -- bubbles
    section_separators = { left = '', right = '' },                     -- bubbles
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {                                                         -- bubbles
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {                                                         -- bubbles
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive', 'quickfix'}
}
