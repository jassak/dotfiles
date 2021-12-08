require('lualine').setup {
    options = {
        icons_enabled = true,
        -- theme = 'onedark',
        component_separators = {left = '|', right = '|'},
        section_separators = {left = '', right = ''},
        -- component_separators = {left = '', right = ''},
        -- section_separators = {left = '', right = ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive', 'quickfix'}
}
-- require('lualine').setup {
--   options = {
--     component_separators = '|',
--     section_separators = { left = '', right = '' },
--   },
--   sections = {
--     lualine_a = {
--       { 'mode', separator = { left = '' }, right_padding = 2 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', separator = { right = '' }, left_padding = 2 },
--     },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {},
-- }
