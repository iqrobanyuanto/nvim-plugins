vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

return{
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim', -- Keep as dependency
    },
    config = function()
      local lspconfig = require('lspconfig')

      -- Autocommand to show diagnostics on CursorHold
      -- This is typically set up *per buffer* when an LSP client attaches.
      -- If you're using `nvim-lspconfig`, this goes inside your `on_attach` function.
      local on_attach = function(client, bufnr)
          -- Ensure diagnostics are enabled for this buffer
          vim.api.nvim_buf_set_option(bufnr, 'buflisted', true)

          -- Autocmd for showing diagnostics on hover
          vim.api.nvim_buf_create_autocmd('CursorHold', {
              buffer = bufnr,
              callback = function()
                  -- Check if there are diagnostics at the current cursor position
                  local diagnostics = vim.diagnostic.get(bufnr, {
                      lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 -- Adjust for 0-indexed line number
                  })

                  if diagnostics and #diagnostics > 0 then
                      -- Open the floating window with diagnostics
                      -- The `float` options defined in vim.diagnostic.config() will be used
                      vim.diagnostic.open_float(nil, {
                          -- You can override global float options here if needed for this specific call
                          -- e.g., border = 'single'
                      })
                  end
              end,
          })

          -- Set keymaps for LSP actions (common practice with on_attach)
          -- Example: 'K' to show hover documentation (which also includes diagnostics if present)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover Documentation' })
          vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show line diagnostics' })
      end

      -- All mason-lspconfig setup is now here
      require('mason-lspconfig').setup({
        ensure_installed = { "gopls", "lua_ls", "ts_ls" },
        -- Use the 'handlers' key instead of a separate setup_handlers call
        handlers = {
          function(server_name) -- Default handler
            -- Pass capabilities and on_attach to each server
            lspconfig[server_name].setup({
              on_attach = on_attach,
            })
          end,
        },
      })
    end,
  },
  {
   "rshkarin/mason-nvim-lint",
   dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
   },
   config = function()
    require("mason-nvim-lint").setup({
      automatic_installed = true,
    })
   end,
  },
}

