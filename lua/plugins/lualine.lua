return{
   {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
     opts = {
    options = {
      component_separators = { left = "|", right = "|" },
      -- section_separators = { left = "", right = "" },
      icons_enabled = false,
    },
    sections = {  
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'%f'},
      lualine_x = {'hostname'},
      lualine_z = {'location'},
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
   } 
}
