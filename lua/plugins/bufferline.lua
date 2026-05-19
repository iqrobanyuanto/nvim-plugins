vim.opt.termguicolors = true
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function()
          return ""
        end,
        separator_style = { "", "" },
        indicator = {
          style = "none",
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      highlights = {
        buffer = { fg = "#ffffff" },
        buffer_visible = { fg = "#ffffff" },
        buffer_selected = { fg = "#7dcfff", bold = true, italic = true },
        tab_selected = { fg = "#7dcfff", bold = true, italic = true },
        warning = { fg = "#ffffff", underline = true, sp = "#e0af68" },
        warning_visible = { fg = "#ffffff", underline = true, sp = "#e0af68" },
        warning_selected = { fg = "#7dcfff", bold = true, italic = true, underline = true, sp = "#e0af68" },
        warning_diagnostic = { fg = "#ffffff", underline = true, sp = "#e0af68" },
        warning_diagnostic_visible = { fg = "#ffffff", underline = true, sp = "#e0af68" },
        warning_diagnostic_selected = { fg = "#7dcfff", bold = true, italic = true, underline = true, sp = "#e0af68" },
        error = { fg = "#ffffff", underline = true, sp = "#ff2424" },
        error_visible = { fg = "#ffffff", underline = true, sp = "#ff2424" },
        error_selected = { fg = "#7dcfff", bold = true, italic = true, underline = true, sp = "#ff2424" },
        error_diagnostic = { fg = "#ffffff", underline = true, sp = "#ff2424" },
        error_diagnostic_visible = { fg = "#ffffff", underline = true, sp = "#ff2424" },
        error_diagnostic_selected = { fg = "#7dcfff", bold = true, italic = true, underline = true, sp = "#ff2424" },
      },
    },
  },
}
