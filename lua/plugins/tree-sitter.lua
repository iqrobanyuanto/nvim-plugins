return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'go',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'python',
          'rust',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
