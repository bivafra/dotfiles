require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map({"n", "i"} ....) for multiple modes
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-s>", "<cmd> wa <CR>", { desc = "Save all files" })
map("n", "<C-a>", "GVgg", { desc = "Select all lines" })

-- now lowercase s is a synonim to cc
map("n", "s", "S", { noremap = true })
-- capital S is a synonim to s(see :h s)
map("n", "S", "s", { noremap = true })

map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>',
--     { desc = "Dont copy replaced text" })
map("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end,
    { remap = false, expr = true, desc = "Dont copy replaced text" })

map({ "n", "t" }, "<A-q>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating terminal" })


map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
map("n", "<leader>dt", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle debug breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start debugging" })

-- map("", "", "", { desc = "" })
-- map("", "", "", { desc = "" })
-- map("", "", "", { desc = "" })
-- map("", "", "", { desc = "" })
