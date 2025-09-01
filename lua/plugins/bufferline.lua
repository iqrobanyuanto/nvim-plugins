vim.opt.termguicolors = true
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            if e == "error" then
              s = s .. n .. " Errors"
              break
            end
          end
          return s
        end,
      },
      highlights = {
        buffer_selected = {
          fg = '#ffffff'
        },
        warning_selected = {
          fg = '#ffffff'
        },
        error = {
          fg = '#ff2424'
        },
        error_visible = {
          fg = '#ff2424'
        },
        error_selected = {
          fg = '#ff2424'
        },
      }
    },
  }
}
