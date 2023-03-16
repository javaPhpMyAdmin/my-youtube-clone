local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,      -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 2,       -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true,   -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float',
  close_on_exit = true,     -- close the terminal window when the process exits
  shell = vim.o.shell,      -- change the default shell
  auto_scroll = true,       -- automatically scroll to the bottom on terminal output
  float_opts = {
    border = 'curved',
    wingblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
