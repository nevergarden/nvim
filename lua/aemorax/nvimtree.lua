local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')

if not nvim_tree_ok then
	return
end

local nvim_autocmd = vim.api.nvim_create_autocmd
local tree_api = require('nvim-tree.api')

local window_count = function()
	return #vim.api.nvim_list_wins()
end

-- Open directory
local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	if directory then
		vim.cmd.cd(data.file)
	end

	tree_api.tree.open()
end

-- Open on entering vim
nvim_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Auto close on last window
nvim_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if window_count() == 1 and
			require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd "quit"
		end
	end
})

local function on_attach(bufnr)
	local function opts(desc)
		return {
			desc = 'nvim-tree: ' .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- Shorthand keymap function
	local keymap = vim.keymap.set

	keymap('n', '<C-]>', tree_api.tree.change_root_to_node, opts('CD'))
	keymap('n', '<C-e>', tree_api.node.open.replace_tree_buffer, opts('Open: In Place'))
	keymap('n', '<C-k>', tree_api.node.show_info_popup, opts('Info'))
	keymap('n', '<C-r>', tree_api.fs.rename_sub, opts('Rename: Omit Filename'))
	keymap('n', '<C-t>', tree_api.node.open.tab, opts('Open: New Tab'))
	keymap('n', '<C-v>', tree_api.node.open.vertical, opts('Open: Vertical Split'))
	keymap('n', '<C-x>', tree_api.node.open.horizontal, opts('Open: Horizontal Split'))
	keymap('n', '<BS>', tree_api.node.navigate.parent_close, opts('Close Directory'))
	keymap('n', '<CR>', tree_api.node.open.edit, opts('Open'))
	keymap('n', '<Tab>', tree_api.node.open.preview, opts('Open Preview'))
	keymap('n', '>', tree_api.node.navigate.sibling.next, opts('Next Sibling'))
	keymap('n', '<', tree_api.node.navigate.sibling.prev, opts('Previous Sibling'))
	keymap('n', '.', tree_api.node.run.cmd, opts('Run Command'))
	keymap('n', '-', tree_api.tree.change_root_to_parent, opts('Up'))
	keymap('n', 'a', tree_api.fs.create, opts('Create'))
	keymap('n', 'bmv', tree_api.marks.bulk.move, opts('Move Bookmarked'))
	keymap('n', 'B', tree_api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
	keymap('n', 'c', tree_api.fs.copy.node, opts('Copy'))
	keymap('n', 'C', tree_api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
	keymap('n', '[c', tree_api.node.navigate.git.prev, opts('Prev Git'))
	keymap('n', ']c', tree_api.node.navigate.git.next, opts('Next Git'))
	keymap('n', 'd', tree_api.fs.remove, opts('Delete'))
	keymap('n', 'D', tree_api.fs.trash, opts('Trash'))
	keymap('n', 'E', tree_api.tree.expand_all, opts('Expand All'))
	keymap('n', 'e', tree_api.fs.rename_basename, opts('Rename: Basename'))
	keymap('n', ']e', tree_api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
	keymap('n', '[e', tree_api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
	keymap('n', 'F', tree_api.live_filter.clear, opts('Clean Filter'))
	keymap('n', 'f', tree_api.live_filter.start, opts('Filter'))
	keymap('n', 'g?', tree_api.tree.toggle_help, opts('Help'))
	keymap('n', 'gy', tree_api.fs.copy.absolute_path, opts('Copy Absolute Path'))
	keymap('n', 'H', tree_api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
	keymap('n', 'I', tree_api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
	keymap('n', 'J', tree_api.node.navigate.sibling.last, opts('Last Sibling'))
	keymap('n', 'K', tree_api.node.navigate.sibling.first, opts('First Sibling'))
	keymap('n', 'm', tree_api.marks.toggle, opts('Toggle Bookmark'))
	keymap('n', 'o', tree_api.node.open.edit, opts('Open'))
	keymap('n', 'O', tree_api.node.open.no_window_picker, opts('Open: No Window Picker'))
	keymap('n', 'p', tree_api.fs.paste, opts('Paste'))
	keymap('n', 'P', tree_api.node.navigate.parent, opts('Parent Directory'))
	keymap('n', 'q', tree_api.tree.close, opts('Close'))
	keymap('n', 'r', tree_api.fs.rename, opts('Rename'))
	keymap('n', 'R', tree_api.tree.reload, opts('Refresh'))
	keymap('n', 's', tree_api.node.run.system, opts('Run System'))
	keymap('n', 'S', tree_api.tree.search_node, opts('Search'))
	keymap('n', 'U', tree_api.tree.toggle_custom_filter, opts('Toggle Hidden'))
	keymap('n', 'W', tree_api.tree.collapse_all, opts('Collapse'))
	keymap('n', 'x', tree_api.fs.cut, opts('Cut'))
	keymap('n', 'y', tree_api.fs.copy.filename, opts('Copy Name'))
	keymap('n', 'Y', tree_api.fs.copy.relative_path, opts('Copy Relative Path'))
	keymap('n', '<2-LeftMouse>', tree_api.node.open.edit, opts('Open'))
	keymap('n', '<2-RightMouse>', tree_api.tree.change_root_to_node, opts('CD'))
end

nvim_tree.setup({
	sort_by = "case_sensitive",
	on_attach = on_attach,
	view = {
		width = 30,
	},
	notify = {
		threshold = vim.log.levels.DEBUG,
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "󰑕",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})
