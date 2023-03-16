local builtin = require('telescope.builtin')

require('telescope').load_extension('lazygit')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".gitignore"
    }
  }
}


vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

vim.keymap.set('n', '<space>gg', ':LazyGit<CR>')
