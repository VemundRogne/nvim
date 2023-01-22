require('toggleterm').setup{
    direction = 'float',
    auto_scroll = false,
    start_in_insert = false,
}

require('toggletasks').setup{
}

require('telescope').load_extension('toggletasks')
