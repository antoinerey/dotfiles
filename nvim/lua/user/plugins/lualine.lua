require('lualine').setup({
  options = {
    -- Get rid of separators between sections.
    section_separators = '',
    component_separators = '',
    -- Keep only one line no matter how panes are open.
    globalstatus = true, 
    theme = {
      normal = {
        -- Tone down the bar colours.
        a = 'StatusLine'
      },
    },
  },
  sections = {
    -- Get rid of filetype, encoding, etc.
    lualine_x = {},
  },
})
