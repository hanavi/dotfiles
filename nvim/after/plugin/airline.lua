-- Airline settings
-- Enable the list of buffers
-- vim.cmd([[ let g:airline#extensions#tabline#enabled = 1 ]])
vim.g["airline#extensions#tabline#enabled"] = 1
-- Show just the filename
-- vim.cmd([[ let g:airline#extensions#tabline#fnamemod = ':t' ]])
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
-- Set the airline theme
-- vim.cmd([[ let g:airline_theme='dark' ]])
vim.g["airline_theme"] = 'dark'
-- let g:airline_theme='jet'
-- vim.cmd([[ let g:airline_powerline_fonts = 1 ]])
vim.g["airline_powerline_fonts"] = 1
