return {
  "coder/claudecode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>a", nil, desc = "AI/Claude" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  },
  opts = {
    terminal = {
      split_side = "right",
      split_width_percentage = 0.4,
    },
  },
}
