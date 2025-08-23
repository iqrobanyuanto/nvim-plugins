-- Set a shorter updatetime for quicker hover popups (default is 4000ms/4s)
-- Be mindful: too low can increase CPU usage, especially with many autocommands.
vim.o.updatetime = 300 -- 300 milliseconds

-- Global diagnostic configuration (recommended to put this early in your init.lua)
vim.diagnostic.config({
    float = {
        border = 'rounded', -- Add a nice rounded border to the float window
        focusable = false,  -- Don't steal focus from the main buffer
        close_on_mouse_down = true, -- Close the float if you click outside it
        scope = 'cursor',   -- Show diagnostics only for the line under the cursor
        source = 'always',  -- Always show the source of the diagnostic (e.g., 'tsserver')
        header = '',        -- No custom header
        prefix = '',        -- No prefix for each diagnostic line in the float
        -- You can also provide a `format` function here to customize the messages in the float
        -- format = function(diagnostic)
        --     return string.format('[%s] %s', diagnostic.source, diagnostic.message)
        -- end,
    },
    -- You might also want to set other diagnostic options here, e.g.:
    underline = true,
    signs = true,
    virtual_text = true, -- Or false if you prefer only hover for messages
    update_in_insert = false,
})

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true -- Always show absolute number for the current line
vim.opt.relativenumber = true -- Show relative numbers for other lines

