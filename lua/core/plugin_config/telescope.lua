local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files,{})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles,{})
vim.keymap.set('n', '<leader>g', builtin.live_grep,{})
vim.keymap.set('n', '<leader>t', builtin.help_tags,{})

