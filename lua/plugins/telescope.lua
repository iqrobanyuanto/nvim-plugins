-- plugins/telescope.lua:
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	'williamboman/mason-lspconfig.nvim',
    },
 },
}
