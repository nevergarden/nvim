-- local colorscheme = 'gruvbox'

-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
--	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
--	return
-- end
--

pcall(vim.cmd, 'highlight Pmenu ctermbg=red ctermfg=white')
pcall(vim.cmd, 'highlight PmenuSel ctermbg=gray ctermfg=black')
pcall(vim.cmd, 'highlight LineNr ctermfg=red')
