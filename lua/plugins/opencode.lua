local opencode_cmd = "opencode --port"

---@type snacks.terminal.Opts
local snacks_terminal_opts = {
  win = {
    position = "right",
    enter = false,
  },
}

local function start_server()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.terminal then
    snacks.terminal.open(opencode_cmd, snacks_terminal_opts)
  else
    vim.cmd("vsplit term://opencode --port | wincmd p")
  end
end

return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  init = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = start_server,
      },
    }
  end,
  keys = {
    { "<leader>o", nil, desc = "OpenCode" },
    { "<leader>oa", function() require("opencode").ask("@this: ") end, mode = { "n", "x" }, desc = "Ask OpenCode…" },
    { "<leader>os", function() require("opencode").select() end, mode = { "n", "x" }, desc = "Select OpenCode…" },
    { "<leader>op", function() require("opencode").prompt("@this ") end, mode = { "n", "x" }, desc = "Prompt OpenCode" },
    { "<leader>oc", function()
      local ok, snacks = pcall(require, "snacks")
      if ok and snacks.terminal then
        snacks.terminal.toggle(opencode_cmd, snacks_terminal_opts)
      else
        start_server()
      end
    end, mode = { "n", "t" }, desc = "Toggle OpenCode terminal" },
    { "<leader>ou", function() require("opencode").command("session.half.page.up") end, desc = "Scroll OpenCode up" },
    { "<leader>od", function() require("opencode").command("session.half.page.down") end, desc = "Scroll OpenCode down" },
    { "go", function() return require("opencode").operator("@this ") end, mode = { "n", "x" }, expr = true, desc = "Append range to OpenCode" },
    { "goo", function() return require("opencode").operator("@this ") .. "_" end, mode = "n", expr = true, desc = "Append line to OpenCode" },
  },
}
