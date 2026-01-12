-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function touch_and_edit()
  local fname = vim.fn.input("New file name: ")
  if fname == "" then
    print("Cancelled: no filename provided.")
    return
  end
  vim.fn.system({ "touch", fname })
  vim.cmd("edit " .. fname)
end

-- Self defined cmd keymaps
vim.keymap.set("n","<leader>k",touch_and_edit,{ desc = "Create & open new file", noremap=true, silent=true })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = "Save the current buffer",  noremap=true})
vim.keymap.set('n', '<Leader>q', ':q<CR>', { desc = "Quit from nvim",  noremap=true})

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files",  noremap=true, silent=true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Grep in project", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "See buffers", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",   { desc = "Help tags", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>",   { desc = "Show git status", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>",   { desc = "Show git commit", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fS", "<cmd>Telescope git_stash<cr>",   { desc = "Show git stash", noremap=true, silent=true })
vim.keymap.set("t", "<C-\\>", "[[<C-\\><C-n>]]",   { desc = "change to terminal mode when in normal mode", noremap=true, silent=true })

-- Windows and buffer navigation keymaps
-- In terminal mode, we must leave terminal-job mode before window commands work.
-- In normal mode, don't send terminal escape keys (they can interfere with normal navigation).
vim.keymap.set("n", "<A-l>", "<C-W>w", { desc = "navigate to the next pane", noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", "<C-W>p", { desc = "navigate to the prev pane", noremap = true, silent = true })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-W>w", { desc = "navigate to the next pane", noremap = true, silent = true })
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-W>p", { desc = "navigate to the prev pane", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>k", ":bd<cr>",   { desc = "delete the current buffer", noremap=true, silent=true })

-- Lsp keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover Documentation' })
vim.keymap.set('n', '<C-k>d', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show line diagnostics' })
