local M = {}

-- Returns true if the current branch has a remote tracking branch
function M.has_remote_branch()
  local remote = vim.fn.system("git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null"):gsub("\n", "")
  return remote ~= ""
end

return M
