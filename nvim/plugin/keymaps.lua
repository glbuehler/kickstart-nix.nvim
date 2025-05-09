if vim.g.did_load_keymaps_plugin then
  return
end
vim.g.did_load_keymaps_plugin = true

-- Remap Esc to switch to normal mode and Ctrl-Esc to pass Esc to terminal
vim.keymap.set('t', '<C-b>', '<C-\\><C-n>', { desc = 'switch to normal mode' })
vim.keymap.set('t', '<C-S-b>', '<C-b>', { desc = 'send <C-b> to terminal' })

vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = 'previous [d]iagnostic' })
vim.keymap.set('n', 'gj', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = 'next [d]iagnostic' })

vim.keymap.set('n', '<C-k>', ':move -2<CR>', {})
vim.keymap.set('n', '<C-j>', ':move +1<CR>', {})

vim.keymap.set('n', '<C-c>', ':nohl<CR>', {});

-- keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move [d]own half-page and center' })
-- keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move [u]p half-page and center' })
-- keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'move DOWN [f]ull-page and center' })
-- keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'move UP full-page and center' })

--- Disabled keymaps [enable at your own risk]

-- Automatic management of search highlight
-- XXX: This is not so nice if you use j/k for navigation
-- (you should be using <C-d>/<C-u> and relative line numbers instead ;)
--
-- local auto_hlsearch_namespace = vim.api.nvim_create_namespace('auto_hlsearch')
-- vim.on_key(function(char)
--   if vim.fn.mode() == 'n' then
--     vim.opt.hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
--   end
-- end, auto_hlsearch_namespace)
