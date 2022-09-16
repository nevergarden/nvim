local status_ok

local numb
status_ok, numb = pcall(require, 'numb')
if status_ok then
	numb.setup()
end

local nvimtree
status_ok, nvimtree = pcall(require, 'nvim-tree')
if status_ok then
	nvimtree.setup()
end
