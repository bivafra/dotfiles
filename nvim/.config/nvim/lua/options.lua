require "nvchad.options"


local o = vim.o
local wo = vim.wo


-- tabs
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- spell checking
-- o.spell = true
-- o.spelllang = 'en_us'

o.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait300-blinkoff200-blinkon150-nCursor'
wo.wrap = false -- don't line break

wo.relativenumber = true

--for UFO plugin
o.foldcolumn = '0' -- '0' is not bad
o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
vim.keymap.set('n', 'zm', require('ufo').closeAllFolds)
-----------------------

-- vim.lsp.set_log_level("debug") -- for lsp debugging
vim.lsp.set_log_level("off") -- Clang log file was huge ~500mb. So disable it

vim.opt.mps:append("<:>")    -- for  jumping betweeen <> like ()





-- format on file save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--     -- vim.lsp.buf.format(...)
--         require("conform").format { lsp_fallback = true }
--     end
-- })
-- foramt on file save (*from conform) (now it is built-in in conform)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     callback = function(args)
--         require("conform").format({ bufnr = args.buf })
--     end,
-- })






-- vim.cmd([[
-- function!   QuickFixOpenAll()
--     if empty(getqflist())
--         return
--     endif
--     let s:prev_val = ""
--     for d in getqflist()
--         let s:curr_val = bufname(d.bufnr)
--         if (s:curr_val != s:prev_val)
--             exec "edit " . s:curr_val
--         endif
--         let s:prev_val = s:curr_val
--     endfor
-- endfunction
-- ]])
-- vim.api.nvim_set_keymap('n', '<leader>ka' , ':call QuickFixOpenAll()<CR>', { noremap=true, silent=false })


-- o.cursorlineopt ='both' -- to enable cursorline!
