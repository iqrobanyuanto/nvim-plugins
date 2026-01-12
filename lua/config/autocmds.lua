-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Autocommand to toggle relativenumber based on mode
local relnum_group = vim.api.nvim_create_augroup("user_relnum_toggle", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = relnum_group,
  callback = function()
    if vim.api.nvim_get_mode().mode == "i" then
      -- In insert mode, show only absolute numbers
      vim.opt.relativenumber = false
    else
      -- In normal mode, show relative numbers
      vim.opt.relativenumber = true
    end
  end,
})

-- Save and restore cursor position when switching windows
-- Store window views (cursor position, scroll position, etc.) per window + buffer.
-- This avoids restoring an old view after the buffer in a window changes.
local window_views = {}

local function should_track_view(buf)
  local bt = vim.bo[buf].buftype
  return bt == "" or bt == "terminal"
end

local augroup = vim.api.nvim_create_augroup("user_window_view_restore", { clear = true })

vim.api.nvim_create_autocmd("WinLeave", {
  group = augroup,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    if should_track_view(buf) then
      window_views[win] = window_views[win] or {}
      -- Save the entire window view (cursor, scroll, etc.)
      window_views[win][buf] = vim.fn.winsaveview()
    end
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = augroup,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local view = window_views[win] and window_views[win][buf]
    -- Restore view if we have a saved view and it's a tracked buffer type
    if view and should_track_view(buf) then
      -- Use vim.schedule to ensure the window is fully set up
      vim.schedule(function()
        -- Verify the window still exists and still shows the same buffer
        if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == buf then
          pcall(vim.fn.winrestview, view)
        end
      end)
    end
  end,
})
