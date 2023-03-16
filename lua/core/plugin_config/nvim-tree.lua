vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = false,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = ""
        }
      }
    }
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})


local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.keymap.set('n', '<c-z>', ':NvimTreeFindFileToggle<CR>')
