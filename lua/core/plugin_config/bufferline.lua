local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    --    mode = "tabs",
    numbers = "none",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    close_icon = 'x',
    color_icons = true,
    buffer_close_icon = 'x',
    middle_mouse_command = nil,
    close_command = ':Bdelete! %d',
    right_mouse_command = ':bdelete! %d',
    left_mouse_command = 'buffer %d',
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    show_buffer_icons = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    indicator = { style = "icon", icon = "▎" },
    enforce_regular_tabs = true,
    separator_style = 'thin'
  },
  highlights = {
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'LspDiagnosticsDefault' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    separator = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    separator_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' }
    },
    background = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    buffer_selected = {
      fg = 'yellow', --'#fdf6e3',
      _ = "bold",
    },
    buffer_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'fg', highlight = 'TabLine' }
    },
    close_button = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    close_button_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    fill = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    }
  },
})

--vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
--vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
