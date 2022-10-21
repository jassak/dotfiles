require('hlargs').setup {
  -- color = '#fac53c',
  color = '#fab4b9',
  highlight = {},
  extras = {
    named_parameters = false,
  },
  excluded_argnames = {
    declarations = {
      python = { 'self', 'cls' },
    },
    usages = {
      python = { 'self', 'cls' },
      lua = { 'self' }
    }
  },
}
