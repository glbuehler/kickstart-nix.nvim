local add_mark = function()
    require('harpoon.mark').add_file()
    print('added ' .. vim.fn.expand('%:.') .. ' to harpoon marks')
end

require('harpoon').setup({
    menu = {
        width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
        height = math.floor(vim.api.nvim_win_get_height(0) * 0.6),
    },
})

vim.keymap.set('n',
    '<leader>hh',
    require('harpoon.ui').toggle_quick_menu,
    { desc = '[h]arpoon quick menu', noremap = true }
)
vim.keymap.set('n',
    '<leader>ha',
    add_mark,
    { desc = '[h]arpoon [a]dd mark', noremap = true }
)
vim.keymap.set('n',
    '<leader>h',
    function()
        local num = tonumber(vim.fn.getcharstr())
        if num then
            require('harpoon.ui').nav_file(num)
        end
    end,
    { desc = '[h]arpoon goto mark', noremap = true }
)
