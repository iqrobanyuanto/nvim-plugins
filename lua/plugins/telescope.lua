-- plugins/telescope.lua:
local telescopeConfig = require("telescope.config")
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    defaults = {
      vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        -- Respect `.gitignore`, but still allow selecting `.env` explicitly.
        find_command = {
          "bash",
          "-lc",
          [[
            {
              # If `.env` exists but is `.gitignore`'d, include it anyway.
              [ -f .env ] && printf '%s\n' '.env'
              rg --files --hidden --glob '!**/.git/*'
            } | awk '!seen[$0]++'
          ]],
        },
      },
    },
  },
}
