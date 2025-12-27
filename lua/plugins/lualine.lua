return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function get_git_info()
        -- 1. Get the current local branch
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")

        -- If not in a git repo, branch will be empty
        if branch == "" then
          return nil
        end

        -- 2. Get the remote tracking branch (e.g., origin/main)
        local remote = vim.fn.system("git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null"):gsub("\n", "")

        -- 3. Return a formatted string or separate values
        if remote ~= "" then
          return string.format(" %s...%s ", branch, remote)
        else
          return string.format( "%s (no remote) ", branch)
        end
      end

      -- Example: Print to the Neovim command line
      print(get_git_info())

      require("lualine").setup({
        options = {
          theme = "powerline_dark",
          -- component_separators = { left = "|", right = "|" },
          -- section_separators = { left = "", right = "" },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { get_git_info },
          lualine_c = { "%f" },
          lualine_y = { "searchcount" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
