local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')

if not nvim_tree_ok then
	return
end

-- Open Directory
local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	if directory then
		vim.cmd.cd(data.file)
	end

	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) 

-- Auto Close On Last Window
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd "quit"
		end
	end
})

nvim_tree.setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	notify = {
		threshold= vim.log.levels.DEBUG,
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})
