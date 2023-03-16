vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'

local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.inccommand = 'split'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true
opt.si = true
opt.wrap = false
opt.backspace = 'start,eol,indent'
opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/*' }
opt.updatetime = 300
opt.signcolumn = 'number'
opt.relativenumber = true
opt.numberwidth = 1
opt.showmatch = true
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'
opt.splitright = true
opt.iskeyword:append('-')
opt.backspace = '2'
opt.autowrite = true
opt.autoread = true
opt.shiftround = true

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

opt.formatoptions:append { 'r' }
