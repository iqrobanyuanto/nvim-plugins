-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- Save file with Leader key
vim.keymap.set('n', '<Leader>w', ':w<CR>')

-- Quit Neovim with Leader key
vim.keymap.set('n', '<Leader>q', ':q<CR>')

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files",  noremap=true, silent=true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Grep in project", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Switch buffers", noremap=true, silent=true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",   { desc = "Help tags", noremap=true, silent=true })


local function touch_and_edit()
  local fname = vim.fn.input("New file name: ")
  if fname == "" then
    print("Cancelled: no filename provided.")
    return
  end
  vim.fn.system({ "touch", fname })
  vim.cmd("edit " .. fname)
end

vim.keymap.set("n","<leader>k",touch_and_edit,{ desc = "Create & open new file"})
