return require('packer').startup(function()

  -- packer 
  use 'wbthomason/packer.nvim'
  
  -- statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- colorschemes
 -- use { 
 --   "npxbr/gruvbox.nvim",
 --   requires = {"rktjmp/lush.nvim"}
 -- }

end)
