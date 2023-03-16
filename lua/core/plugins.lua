local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- THEMES
  use 'ellisonleao/gruvbox.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use 'norcalli/nvim-colorizer.lua'
  use "EdenEast/nightfox.nvim"
  use 'shaunsingh/nord.nvim'


  -- SIDE EXPLORER TREE
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  -- PLUGIN FOR TEST
  use "vim-test/vim-test"

  -- MASON SERVER
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- TELESCOPE
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim', { "kdheepak/lazygit.nvim" } } },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  }

  -- TMUX & SPLIT WINDOW NAVIGATION
  use 'christoomey/vim-tmux-navigator'
  use 'szw/vim-maximizer'

  -- LSP AND ASSOCIATED PLUGINS
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, --  Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },                -- Optional
      { 'hrsh7th/cmp-path' },                  -- Optional
      { 'saadparwaiz1/cmp_luasnip' },          -- Optional
      { 'hrsh7th/cmp-nvim-lua' },              -- Snippets
      { 'L3MON4D3/LuaSnip' },                  -- Required
      { 'rafamadriz/friendly-snippets' },      -- Optional
    }
  }


  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'akinsho/bufferline.nvim'


  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'tpope/vim-surround'
  use 'vim-scripts/ReplaceWithRegister'

  -- COMMENT WITH gc
  use 'numToStr/Comment.nvim'
  use 'jose-elias-alvarez/typescript.nvim'

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })


  use(
    {
      "lmburns/lf.nvim",
      requires = { "plenary.nvim", "toggleterm.nvim" }
    }
  )

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  -- My plugins here
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
