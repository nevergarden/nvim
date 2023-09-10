local numb_ok, numb = pcall(require, 'numb')
if numb_ok then
	numb.setup()
end

local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if nvimtree_ok then
	nvimtree.setup()
end

local hop_ok, hop = pcall(require, 'hop')
if hop_ok then
	hop.setup()
end

local lualine_ok, lualine = pcall(require, 'lualine')
if lualine_ok then
	lualine.setup({
		options = {
			theme = 'auto'
		}
	})
end

local has_trouble, trouble = pcall(require, "trouble")
if has_trouble then
	trouble.setup()
end

local has_todo_comments, todo_comments = pcall(require, "todo-comments")
if has_todo_comments then
	todo_comments.setup()
end

local lspfrmt_status_ok, lspformat = pcall(require, 'lsp-format')
if lspfrmt_status_ok then
	lspformat.setup({})
end

local presence_ok, presence = pcall(require, 'presence')
if presence_ok then
	presence.setup({
		auto_update         = true,
		neovim_image_text   = "Neovim",
		main_image          = "neovim",
		client_id           = "793271441293967371",
		log_level           = nil,
		debounce_timeout    = 10,
		enable_line_number  = false,
		blacklist           = {},
		buttons             = true,
		show_time           = true,
		editing_text        = "Editing %s",
		file_explorer_text  = "Browsing %s",
		git_commit_text     = "Committing changes",
		plugin_manager_text = "Managing plugins",
		reading_text        = "Reading %s",
		workspace_text      = "Working on %s",
		line_number_text    = "Line %s out of %s",
	})
end

local telescope_ok, telescope = pcall(require, 'telescope')

if telescope_ok then
	telescope.load_extension('dap')
end

local dap_ok, dap = pcall(require, 'dap')
if dap_ok then
	dap.adapters.lldb = {
		type = 'executable',
		command = '/usr/bin/lldb-vscode',
		name = 'lldb'
	}

	dap.configurations.c = {
		{
			name = 'Launch C',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		},
		{
			name = 'Launch C 1 Arg',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {
				function()
					return vim.fn.input('Arg1: ')
				end
			},
		}
	}
end
