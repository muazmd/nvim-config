require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed= {"lua_ls", "gopls"}
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
--[[
	vim.keymap.set('n', '<leader>rn' , vim.lsp.buf.rename,{})
	vim.keymap.set('n', '<leader>ca' , vim.lsp.buf.code_action,{})
	vim.keymap.set('n', 'gd' , vim.lsp.buf.definition,{})
	vim.keymap.set('n', 'gi' , vim.lsp.buf.implementation,{})
	vim.keymap.set('n', 'gr' , require("telescope.builtin").lsp_reference,{})
	vim.keymap.set('n', 'K' , vim.lsp.buf.hover,{})
	]]--
	local on_attach = function(_,_)
		vim.keymap.set('n', '<leader>rn' , vim.lsp.buf.rename,{})
		vim.keymap.set('n', '<leader>ca' , vim.lsp.buf.code_action,{})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
		vim.keymap.set('n', 'gi' , vim.lsp.buf.implementation,{})
		vim.keymap.set('n', 'gr' , require("telescope.builtin").lsp_reference,{})
		vim.keymap.set('n', 'K' , vim.buf.hover,{})
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev())
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next())
	end

require("lspconfig").gopls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
}
require("lspconfig").lua_ls.setup{
	on_attach = on_attach,
	settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim','client'},
      },
    },
  },
}

 function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end

