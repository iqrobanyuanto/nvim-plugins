-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Autocommand to toggle relativenumber based on mode
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
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
