local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

vim.notify = function(msg, log_level)
	if msg:match("exit code") then
			return
	end
	if log_level == vim.log.levels.ERROR then
			vim.api.nvim_err_writeln(msg)
	else
			vim.api.nvim_echo({{msg}}, true, {})
	end
end

--lspconfig['clangd'].setup({})
lspconfig['ccls'].setup({})

lspconfig['lua_ls'].setup({
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.expand("$HOME/.luarocks/share/lua/5.4")] = true,
				}
			},
		},
	}
})

lspconfig['cmake'].setup({
	cmd = {'cmake-language-server'},
	filetypes = {'cmake'},
})
